Forum::Engine.routes.draw do

  resources :articles
  resources :tags
  resources :comments, except:[:index, :show]

  root to: 'home#index'
end
