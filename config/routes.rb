Rails.application.routes.draw do
  devise_for :users
  scope ':locale', locale: /ar|en/ do
    resources :employees do
      resources :professional_data
    end
  end
  root 'application#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
