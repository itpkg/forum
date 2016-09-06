Forum::Engine.routes.draw do

  resources :articles
  resources :tags
  resources :comments, except:[:index, :show]

  post 'rate' => 'home#rate'
  root to: 'home#index'
end
