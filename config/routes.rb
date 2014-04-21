Rails.application.routes.draw do
  #Background tasks
  mount Resque::Server, :at => "/resque"

  root :to => "frontpage#index"

  get 'home' => 'home#index', :as => :home
  get 'home' => 'home#index', :as => :user_root # devise after_sign_in_path_for

  ##API###
  get 'api/keygen' => 'api#create_key', :as => :api_keygen
  get 'api/user/:id' => 'api#users'
  get 'api/me' => 'api#users'
  get 'api/me/home/' => 'api#activity_atom_feed', :format => 'atom', :as => :api_my_home
  get 'api/user/:id/public' => 'api#activity_atom_feed', :format => 'atom'
  ##/API##

  # Webfinger
  get '.well-known/host-meta',:to => 'frontpage#host_meta'

  # Social Stream subjects configured in config/initializers/social_stream.rb
  SocialStream.subjects.each do |actor|
    resources actor.to_s.pluralize do
      resource :like
      resource :profile
      resources :activities
    end
  end

  resources :contacts do
    collection do
      get 'suggestion'
    end
  end

  resources :spheres
  namespace "relation" do
    resources :customs
  end
  resources :permissions

  get 'tags'     => 'tags#index', :as => 'tags'

  # Find subjects by slug
  get 'subjects/lrdd/:id' => 'subjects#lrdd', :as => 'subject_lrdd'

  resource :representation

  resources :settings

  resources :messages

  resources :conversations

  resources :invitations

  resources :notifications do
    collection do
      put 'update_all'
    end
  end

  resources :comments

  resources :activities do
    resource :like
  end


  # Social Stream objects configured in config/initializers/social_stream.rb
  (SocialStream.objects - [ :actor ]).each do |object|
    resources object.to_s.pluralize
  end
end
