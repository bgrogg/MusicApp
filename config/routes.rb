Rails.application.routes.draw do
  root to: redirect("/bands")

  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :edit, :show, :update] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :destroy, :edit, :show, :update]


end
