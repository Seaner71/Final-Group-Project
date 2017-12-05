Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'


  resources :questions do
      resources :answers do
        member do
          put "like", to: "answers#upvote"
          put "dislike", to: "answers#downvote"
        end
      end

  end
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
