Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup}

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages do
    member do
      get :result
      post :gist, controller: 'gists'
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists
  end

end
