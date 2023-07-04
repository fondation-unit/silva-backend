Rails.application.routes.draw do  
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  get "/current_user", to: "current_user#index"
  patch "/current_user", to: "current_user#update"
  get "/admin", to: "admin#index"

  namespace :api do
    namespace :v1 do
      resources :scenarii
    end
  end
end
