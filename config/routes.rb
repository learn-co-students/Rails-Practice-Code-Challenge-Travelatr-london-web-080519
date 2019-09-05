Rails.application.routes.draw do
  resources :posts, only: [:show, :new, :create, :edit, :update]
  resources :destinations, only: [:show]
  resources :bloggers, only: [:show, :new, :create]
  patch '/posts/:id/like', to: 'posts#like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
