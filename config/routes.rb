Rails.application.routes.draw do
  root to: "homes#top"

  devise_for :admins, controllers: {
    sessions:  'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :members, controllers: {
     sessions:     'members/sessions',
     passwords:    'members/passwords',
     registrations: 'members/registrations'
  }

end
