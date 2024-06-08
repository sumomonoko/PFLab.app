Rails.application.routes.draw do
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'ideal' => 'homes#ideal'
    resources :users, only: [:show, :edit, :update]
    resources :foods, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  end
  
  amespace :admin do
    root to: 'homes#top'
    resources :foods, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end


  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
