Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'ideal' => 'homes#ideal'
    resources :users, only: [:show, :edit, :update] do
      resources :rooms, only: [:create, :show, :index] do
        resources :dms, only: [:create, :destroy]
      end
      resource :relationships, only: [:create, :destroy]
    	get "followings" => "relationships#followings", as: "followings"
    	get "followers" => "relationships#followers", as: "followers"
    end
    resources :foods, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :relationships, only: [:followed, :follower, :create, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :foods, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :destroy]
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
