Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :vocabs
      resources :speeches, only: :show, param: :en
      mount_devise_token_auth_for "User", at: "auth"
    end
  end
end
