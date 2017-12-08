Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  post 'users/:id/', to: 'users#show'

  resources :users
  resources :tags

  resources :blogs do
    collection do
      match 'search' => 'blogs#search', via: [:get, :post], as: :search
    end
    resources :comments
  end

  resources :questions do
    collection do
      match 'search' => 'questions#search', via: [:get, :post], as: :search
    end
    resources :answers do
        member do
          put "like", to: "answers#upvote"
          put "dislike", to: "answers#downvote"
        end
      end
  end

  root 'welcome#index'
end
