Rails.application.routes.draw do

  namespace :admin do
    get 'questions/index'
    get 'questions/show'
    get 'questions/edit'
  end
  root to: "homes#top"

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :members, controllers: {
     sessions:      'public/sessions',
     passwords:     'public/passwords',
     registrations: 'public/registrations'
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :members, only:[:index, :show, :edit]
    get "/follow"  => "members#follow"
    resources 
    

  end

end
