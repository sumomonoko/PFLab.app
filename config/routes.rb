Rails.application.routes.draw do
  
  
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'foods/index'
    get 'foods/show'
  end
  namespace :admin do
    get 'genres/index'
  end
  namespace :public do
    get 'rooms/index'
    get 'rooms/show'
  end
  namespace :public do
    get 'relationships/followers'
    get 'relationships/followings'
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
