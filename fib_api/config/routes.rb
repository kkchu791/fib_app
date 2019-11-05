Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'loaderio-ffcb8beb4c4a06aabd3297688b477fea/', to: 'application#load_test', as: 'load_test'

  namespace :api do
    namespace :v1 do
      get 'current', to: 'fib_numbers#current', as: 'current'
      get 'next', to: 'fib_numbers#next', as: 'next'
      get 'previous', to: 'fib_numbers#previous', as: 'previous'
      get 'reset', to: 'fib_numbers#reset', as: 'reset'
    end
  end
end
