require 'rest-client'
namespace :import do
  # Give a description for the task
  # Define the task
  task initialImport: :environment do
    response = RestClient.get 'https://api.matinfo.no/v2/updatedsince/2019,02,15?api_key=218dcaad-59b0-49ec-895c-7fef5857a74c', {accept: :json}
    #puts(response.body)

    gtins = JSON.parse(response.body)

    product_info_array = []

    gtins.each do |gtin|
      product_info = RestClient.get 'https://api.matinfo.no/v2/productfull/gtin/07033330013160?api_key=218dcaad-59b0-49ec-895c-7fef5857a74c', {accept: :json}
      product_info_array.push(JSON.parse(product_info.body))
    end

    puts(product_info_array[0]['sh:StandardBusinessDocument']['eanucc:message']['eanucc:transaction']['command']['eanucc:documentCommand']['documentCommandOperand']['gdsn:catalogueItemNotification']['catalogueItem']['tradeItem']['extension']['fbt:foodAndBeverageTradeItemExtension']['foodAndBeverageInformation']['foodAndBeverageIngredientInformation']['ingredientStatement']['description']['text'])

  end

  task refreshDatabase: :environment do

  end
end
