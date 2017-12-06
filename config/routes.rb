Rails.application.routes.draw do


  get 'tags/index'


  devise_for :users
  get 'welcome/index'
  post 'users/:id/', to: 'users#show'


resources :users
resources :blogs



  resources :questions do
      resources :answers do
        member do
          put "like", to: "answers#upvote"
          put "dislike", to: "answers#downvote"
        end
      end

  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
