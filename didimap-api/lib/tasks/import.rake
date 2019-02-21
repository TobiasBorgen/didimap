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
	new_product = FoodProduct.new
	new_product.gtin = product_info_array[0]['sh:StandardBusinessDocument']['eanucc:message']['eanucc:transaction']['command']['eanucc:documentCommand']['documentCommandOperand']['gdsn:catalogueItemNotification']['catalogueItem']['tradeItem']['tradeItemIdentification']['gtin']
	new_product.food = product_info_array[0]['sh:StandardBusinessDocument']['eanucc:message']['eanucc:transaction']['command']['eanucc:documentCommand']['documentCommandOperand']['gdsn:catalogueItemNotification']['catalogueItem']['tradeItem']['tradeItemInformation']['tradeItemDescriptionInformation']['functionalName']['description']['shortText']
	new_product.producer = product_info_array[0]['sh:StandardBusinessDocument']['eanucc:message']['eanucc:transaction']['command']['eanucc:documentCommand']['documentCommandOperand']['gdsn:catalogueItemNotification']['catalogueItem']['tradeItem']['tradeItemInformation']['tradeItemDescriptionInformation']['brandName']
	new_product.ingredients = product_info_array[0]['sh:StandardBusinessDocument']['eanucc:message']['eanucc:transaction']['command']['eanucc:documentCommand']['documentCommandOperand']['gdsn:catalogueItemNotification']['catalogueItem']['tradeItem']['extension']['fbt:foodAndBeverageTradeItemExtension']['foodAndBeverageInformation']['foodAndBeverageIngredientInformation']['ingredientStatement']['description']['text']
	new_product.image_path = product_info_array[0]['sh:StandardBusinessDocument']['eanucc:message']['eanucc:transaction']['command']['eanucc:documentCommand']['documentCommandOperand']['gdsn:catalogueItemNotification']['catalogueItem']['tradeItem']['tradeItemInformation']['tradeItemDescriptionInformation']['tradeItemExternalInformation']['uniformResourceIdentifier']
	#new_product.proteins_per_100 = 
	#new_product.carbohydrates_per_100 = 
	#new_product.fat_per_100 = 
	#new_product.calories_per_100 = 
	#new_product.calories_total = 

	allergens = product_info_array[0]['sh:StandardBusinessDocument']['eanucc:message']['eanucc:transaction']['command']['eanucc:documentCommand']['documentCommandOperand']['gdsn:catalogueItemNotification']['catalogueItem']['tradeItem']['extension']['fbt:foodAndBeverageTradeItemExtension']['foodAndBeverageInformation']['foodAndBeverageAllergyRelatedInformation']['foodAndBeverageAllergen']
	puts allergens[0]
	#new_product.gluten = 
	#new_product.bygg = 
	#new_product.havre = 
	#new_product.hvete =
	#new_product.kamut =
	#new_product.rug =
	#new_product.spelt =
	#new_product.skalldyr =
	#new_product.fisk =
	#new_product.egg =
	#new_product.melk =
	#new_product.peanøtter =
	#new_product.soyabønner =
	#new_product.nøtter =
	#new_product.cashewnøtter =
	#new_product.hasselnøtter =
	#new_product.makadamianøtter =
	#new_product.mandel =
	#new_product.paranøtter =
	#new_product.pekannøtter =
	#new_product.pistasjnøtter =
	#new_product.valnøtter =
	#new_product.sesamfrø =
	#new_product.selleri =
	#new_product.sennep =
	#new_product.svoveldioksid_og_sulfitter =
	#new_product.lupin =
	#new_product.bløtdyr =

	#new_product.oligo_value = 
	#new_product.fructose_value = 
	#new_product.polyol_value = 
	#new_product.lactose_value =


  end

  task refreshDatabase: :environment do

  end
end
