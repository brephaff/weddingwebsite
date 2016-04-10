Rails.application.routes.draw do
  root 'pages#home'

  resources :households, :only => [:edit, :update], :path => 'rsvp' do
     match :lookup, :on => :collection, :via => [:get, :post]
  end

  namespace :admin do
    resources :households, :except => :show
    resources :people, :except => :show do
      get :import, :on => :collection
      post :upload, :on => :collection
    end
  end
end
