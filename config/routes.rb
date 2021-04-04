Rails.application.routes.draw do

  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
    get 'tags/show'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    get 'members/connection'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
    get 'members/followed'
    get 'members/follower'
  end
  namespace :public do
    get 'contacts/new'
  end
  namespace :public do
    get 'responses/edit'
  end
  namespace :public do
    get 'answers/edit'
  end
  namespace :public do
    get 'tags/index'
    get 'tags/show'
  end
  namespace :public do
    get 'questions/show'
    get 'questions/edit'
    get 'questions/new'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
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

end
