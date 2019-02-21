Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'check_fodmaps/checkingredients'
      post 'check_fodmaps/checkingredients'
      post 'check_fodmaps/checkingredientsconsumerdatabase'
      post 'check_fodmaps/addingredientsconsumerdatabase'

	  get 'barcode_scanner/scanbarcode'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
