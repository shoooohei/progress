Rails.application.routes.draw do
  resources :sessions, only: [ :new, :create, :destroy]

  resources :conditions, only: [ :new, :create, :edit, :update, :destroy ]
  resources :students, only: [ :index, :show, :new, :create ]
end
