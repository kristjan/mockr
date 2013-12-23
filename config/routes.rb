Mockr::Application.routes.draw do
  resources :comments

  resources :mocks

  root to: 'home#index'

  devise_for :users, controllers: {registrations: 'users/registrations'},
    path: '', :path_names => {sign_in: "sign-in", sign_up: "sign-up"}
end
