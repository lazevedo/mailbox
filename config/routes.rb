Rails.application.routes.draw do
  devise_for :users
  resources :messages, :except => :destroy
end
