Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resource :customers, only: [:show, :edit, :update]
    post 'customer/confilm' => 'customers#confilm'
    patch 'customer/hide' => 'customers#hide'
    resources :addresses, except: [:new, :show]
    resources :orders, except: [:destroy, :edit, :update]do
      resources :order_items, only: [:create, :destroy]
    end
    post 'order/confilm' => 'orders#confilm'
    get 'order/thanks' => 'orders#thanks'
    resources :cart_items, except: [:index, :edit, :new]
    delete 'cart_item/destroy_all' => 'cart_items#destroy_all'
    resources :items, only: [:index, :show]
    get 'search' => 'searchs#search'
  end

  namespace :admin do
    resources :customers, except: [:new, :destroy, :create]
    resources :orders, only: [:index, :show]
    patch 'order/orders_update' => 'orders#orders_update'
    put 'order/orders_update' => 'orders#orders_update'
    patch 'order/items_update' => 'orders#items_update'
    put 'order/items_update' => 'orders#items_update'
    resources :items, except: [:destroy]
    get 'search' => 'searchs#search'
    resources :genres, except: [:new, :destroy, :show]
  end

end
