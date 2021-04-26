Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
  }

  devise_for :members, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations',
    confirmations: 'public/confirmations',
    omniauth_callbacks: 'public/omniauth_callbacks',
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :members, only: [:index, :show, :edit, :update]
    get "/connections" => "members#connection"
    resources :questions, only: [:index, :show, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
    resources :contacts, only: [:index]
  end

  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    get "/questions" => "questions#new"
    get "/contacts" => "contacts#new"
    get "questions/:id/answers" => "questions#show"
    patch "/members/withdraw" => "members#withdraw"
    patch "/questions/best_answer" => "answers#bestanswer"
    get "/questions/tag" => "members#tag"
    get "/search" => "searches#search"
    resources :members, only: [:index, :show, :edit, :update] do
      get :connections, on: :member
    end
    post "/guest_sign_in", to: "members#guest_sign_in"
    resources :questions, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :answers, only: [:show, :create, :edit, :update, :destroy]
      resource :question_likes, only: [:create, :destroy]
    end
    resources :answers do
      resources :responses, only: [:show, :create, :edit, :update, :destroy]
      resource :answer_likes, only: [:create, :destroy]
    end
    resources :tags, only: [:index, :show]
    resources :contacts, only: [:new, :create]
    post 'follow/:id' => 'relationships#create', as: 'follow'
    post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  end
end
