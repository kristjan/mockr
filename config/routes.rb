Mockr::Application.routes.draw do

  resources :organizations

  resources :comments

  resources :mocks

  resources :users, only: %i[index show]

  root to: 'home#index'

  devise_for :users,
    controllers: {
      registrations: 'users/registrations'
    },
    path: '',
    path_names: {
      sign_in: "sign-in",
      sign_up: "sign-up"
    }
end
