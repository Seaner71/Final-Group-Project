Rails.application.routes.draw do

  get 'tags/index'
  get 'tags/show'

  devise_for :users
  get 'welcome/index'
  post 'users/:id/', to: 'users#show'

  resources :users
  resources :blogs
  resources :tags

  resources :questions do
      resources :answers do
        member do
          put "like", to: "answers#upvote"
          put "dislike", to: "answers#downvote"
        end
      end
  end

  root 'welcome#index'
end
