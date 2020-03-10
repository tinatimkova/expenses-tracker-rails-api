# frozen_string_literal: true

Rails.application.routes.draw do
  resources :transactions, except: %i[new edit]
  resources :categories, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  get '/categories/:category_id/transactions' => 'transactions#show_by_category'
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
