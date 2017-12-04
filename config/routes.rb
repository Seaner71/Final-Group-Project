Rails.application.routes.draw do
  get 'questions/index'

  get 'questions/show'

  get 'questions/edit'

  get 'questions/create'

  get 'questions/destroy'

  get 'questions/new'

  devise_for :users
  get 'welcome/index'

  resources :answers 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
