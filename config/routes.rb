Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  post '/', to: 'welcome#signin'
  get '/logout', to: 'welcome#signout'

  get 'dashboard_users', to: 'dashboard_users#index'

  get 'dashboard_news', to: 'dashboard_news#index'
  post 'dashboard_news', to: 'dashboard_news#create'
  put 'dashboard_news/:id', to: 'dashboard_news#update'
  delete 'dashboard_news/:id', to: 'dashboard_news#destroy'

  get 'dashboard_user_type', to: 'dashboard_user_type#index'
  post 'dashboard_user_type', to: 'dashboard_user_type#create'
  put 'dashboard_user_type/:id', to: 'dashboard_user_type#update'
  delete 'dashboard_user_type/:id', to: 'dashboard_user_type#destroy'

  get 'dashboard_place_type', to: 'dashboard_place_type#index'
  post 'dashboard_place_type', to: 'dashboard_place_type#create'
  put 'dashboard_place_type/:id', to: 'dashboard_place_type#update'
  delete 'dashboard_place_type/:id', to: 'dashboard_place_type#destroy'

  get 'dashboard_address_type', to: 'address_type#index'
  post 'dashboard_address_type', to: 'address_type#create'
  put 'dashboard_address_type/:id', to: 'address_type#update'
  delete 'dashboard_address_type/:id', to: 'address_type#destroy'

  scope 'api/v1', module: 'api/v1' do
    scope 'auth' do
      post 'signin', to: 'auth#signin'
      post 'signup', to: 'auth#signup'
    end

    post 'nearby', to: 'nearby#index'
    get 'search/:name', to:'search#search'
    resource :user, only: [:show, :update]

    scope 'my' do
      resources :favorite_place, only: [:create, :index, :show, :destroy]
      resources :user_address, except: [:new, :edit]
    end

    resources :place, except: [:new, :edit] do
      resources :picture, only: [:create, :destroy]
      resources :product, except: [:new, :edit]
    end

    resources :user_type, except: [:new, :edit]
    resources :place_category, except: [:new, :edit]
    resources :address_type, except: [:new, :edit]
    resources :news, except: [:new, :edit]
  end
end
