Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :countries, only: [:index, :show] do
    resources :plans, only: [:show]
  end

  root to: 'countries#index'
end
