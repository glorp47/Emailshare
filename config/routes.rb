Rails.application.routes.draw do

# get "users", to: "users#index"
# post "users", to: "users#create"
# get "users/:id", to: "users#show"
# patch "users/:id", to: "users#update"
#
# put "users/:id", to: 'users#update'
# delete "users/:id", to: 'users#destroy'
# get "users/new", to: 'users#new'
# get "users/:id/edit", to: 'users#edit'


  resources :users do
    resources :contacts, only: [:index]
    resources :contact_shares, only: [:index]
  end


  resources :contacts, except: [:index]
  resources :contact_shares, except: [:index]
end
