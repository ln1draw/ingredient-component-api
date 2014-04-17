EpicookbookAPI::Application.routes.draw do
  namespace :api do
    get '/ingredients/find/:name' => 'ingredients#by_name'
    
    resources :component_ingredients

    resources :ingredients

    resources :components

    post '/ingredients' => 'ingredients#create'
  end

  devise_for :admins

  resources :component_ingredients

  resources :ingredients

  resources :components

  root 'welcome#index'

  get 'add_user' => 'welcome#add_user'

  get 'documentation' => 'welcome#documentation'

  get 'unverified' => 'ingredients#unverified'
end
