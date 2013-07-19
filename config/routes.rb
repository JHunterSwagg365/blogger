Blogger::Application.routes.draw do
  
  root "articles#index"
  resources :tags
  
  resources :articles do
  	resources :comments
  end
end
