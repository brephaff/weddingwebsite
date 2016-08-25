Rails.application.routes.draw do
  root 'pages#home'

  resources :photos, :only => [:index, :create, :show] do
    get :uploaded, :on => :collection
  end

  resources :households, :only => [:index, :edit, :update], :path => 'rsvp' do
    match :lookup, :on => :collection, :via => [:get, :post]
  end

  namespace :admin do
    resources :photos, :only => [:index, :destroy] do
      post :accept_all, :on => :collection
      post :accept, :on => :member
    end
    resources :households, :except => :show
    resources :people, :except => :show do
      get :import, :on => :collection
      post :upload, :on => :collection
    end
  end
end
