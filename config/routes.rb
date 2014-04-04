EpicookbookAPI::Application.routes.draw do
  
  devise_for :admins

  get '/ingredients/find/:name' => 'ingredients#by_name'

  resources :component_ingredients

  resources :ingredients

  resources :components

  root 'welcome#index'

  get 'add_user' => 'welcome#add_user'

  get 'documentation' => 'welcome#documentation'

  get 'unverified' => 'ingredients#unverified'
end
