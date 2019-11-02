Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'current', to: 'fib_numbers#current', as: 'current'
      get 'next', to: 'fib_numbers#next', as: 'next'
      get 'previous', to: 'fib_numbers#previous', as: 'previous'
      get 'reset', to: 'fib_numbers#reset', as: 'reset'
    end
  end
end
