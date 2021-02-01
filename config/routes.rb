Rails.application.routes.draw do
  resources :tests do
    resources :questions, only: [:index, :show, :create, :destroy]
  end
  get 'questions/new', to: 'questions#new'
end
