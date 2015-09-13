Rails.application.routes.draw do
  root 'pages#home'

  resources :households, :only => [:index, :show, :update] do
    post :lookup, :on => :collection
  end

  namespace :admin do
    resources :people do
      get :import, :on => :collection
      post :upload, :on => :collection
    end
  end
end
