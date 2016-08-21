Rails.application.routes.draw do
  root 'pages#home'

  resources :photos, :only => [:index, :create, :show]

  resources :households, :only => [:index, :edit, :update], :path => 'rsvp' do
    match :lookup, :on => :collection, :via => [:get, :post]
  end

  namespace :admin do
    resources :photos, :only => [:index, :update, :destroy]
    resources :households, :except => :show
    resources :people, :except => :show do
      get :import, :on => :collection
      post :upload, :on => :collection
    end
  end
end
