Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in", as: :guest_sign_in
  end

  get "home/index"
    resources :entries do
  resource :like, only: [:create, :destroy]
end

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"


end