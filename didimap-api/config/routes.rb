Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'check_fodmaps/checkingredients'
      post 'check_fodmaps/checkingredients'
    end
  end
  get 'check_fodmaps/checkingredients'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'checkingredients', to: 'application#checkingredients'
end
