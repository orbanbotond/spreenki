Enki::Application.routes.draw do
  # namespace 'admin' do
  namespace 'admin', :path => "admin/blog" do
    resource :session
  
    resources :posts, :pages do
      post 'preview', :on => :collection
    end
    resources :comments
    resources :undo_items do
      post 'undo', :on => :member
    end
  
    match 'health(/:action)' => 'health', :action => 'index', :as => :health
  
    root :to => 'dashboard#show'
  end
  
  resources :archives, :only => [:index]
  resources :pages, :only => [:show]

  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    post 'blog/:year/:month/:day/:slug/comments' => 'comments#index'
    get 'blog/:year/:month/:day/:slug/comments/new' => 'comments#new'
    get 'blog/:year/:month/:day/:slug' => 'posts#show'
  end

  scope :to => 'posts#index' do
    get 'format/posts.:format', :as => :formatted_posts
    # get 'tags/(:tag)', :as => :posts
    get 'tags/(:tag)(.:format)', :as => :posts
  end
  
  root :to => 'posts#index'

  match "shop" => 'products#index'
end
