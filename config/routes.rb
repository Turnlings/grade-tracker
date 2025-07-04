# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :years
  resources :semesters
  resources :uni_modules do
    resources :exams
    resources :timelogs
  end
  resources :exam_results

  post 'quick_log', to: 'pages#quick_log'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'

  # Fix for sign out bug
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
