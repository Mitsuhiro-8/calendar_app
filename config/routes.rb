Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  root "calendars#index"

  resources :calendars do
    resources :events, only: [:create, :edit, :update, :destroy]
    resources :users, only: [:edit, :update]
    resources :comments, only: [:new, :create, :destroy]
  end
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get 'users/calendar', to: 'users/registrations#new_calendar'
    post 'users/calendar', to: 'users/registrations#create_calendar'
  end
end
