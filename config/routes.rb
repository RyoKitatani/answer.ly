Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
  }

  devise_for :members, controllers: {
     sessions:      'public/sessions',
     passwords:     'public/passwords',
     registrations: 'public/registrations',
     confirmations: 'public/confirmations'
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :members, only:[:index, :show, :edit, :update]
    get "/connections" => "members#connection"
    resources :questions, only:[:index, :show, :edit, :update]
    resources :tags, only:[:index, :show, :edit, :update]
  end

  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    patch "/members/withdraw" => "members#withdraw"
    get "/questions/tag" => "members#tag"
    resources :members, only:[:show, :edit, :update] do
      get :connections, on: :member
    end
    post "/guest_sign_in", to: "members#guest_sign_in"
    resources :questions, only:[:show, :new, :create, :edit, :update, :destroy] do
      resources :answers, only:[:show, :create, :edit, :update, :destroy]
      resource :question_likes, only: [:create, :destroy]
    end
    resources :answers do
      resources :responses, only:[:show, :create, :edit, :update, :destroy]
      resource :answer_likes, only: [:create, :destroy]
    end
    resources :tags, only:[:index, :show]
    resources :contacts, only:[:new, :create]
    post 'follow/:id' => 'relationships#create', as: 'follow'
    post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  end

end