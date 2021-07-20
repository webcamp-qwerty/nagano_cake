Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resource :customers, only: [:show]
    get 'customers_info/edit' => 'customers#edit',as: 'edit_customer'
      #resourceでeditを作成するとdeviseのedit_customer_registrationパスと同じURIになるため、個別にURとパスを作成して対応
    patch 'customers_info/edit' => 'customers#update'
      #resourceでupdateを作成すると、上記のcustomerパスに対してpatchはあるが、edit_customerパスにはpatchがないため、ルーティングエラーが発生する
      #これを回避するためにresourceではなく個別にパスを作成した
    post 'customer/confirm' => 'customers#confirm'
    patch 'customer/hide' => 'customers#hide'
    resources :addresses, except: [:new, :show]
    resources :orders, except: [:destroy, :edit, :update]do
      resources :order_items, only: [:create, :destroy]
    end
    post 'order/confirm' => 'orders#confirm'
    get 'order/thanks' => 'orders#thanks'
    resources :cart_items, except: [:show, :edit, :new]
    delete 'cart_item/destroy_all' => 'cart_items#destroy_all'
    resources :items, only: [:index, :show]
    get 'search' => 'searchs#search'
  end

  namespace :admin do
    resources :customers, except: [:new, :destroy, :create]
    resources :orders, only: [:index, :show, :update]
    resources :orders_item, only: [:update]
    resources :items, except: [:destroy]
    get 'search' => 'searchs#search'
    resources :genres, except: [:new, :destroy, :show]
  end

end
