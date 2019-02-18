class Api::V1::CheckFodmapsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def checkingredients
    puts "IN API FUNCTION"
    text = params[:imageText]
    #puts text

    ingredients = text.split(',')
    puts ingredients

    ingredient_info = Array.new
    ingredients.each do |ingredient|
      #Fuzzy find by name kan være smart
      info = FoodItem.where(food: ingredient.chomp('').strip).first
      unless info.blank?
        ingredient_info.push(info)
      else
        item = FoodItem.new
        item.food = ingredient.chomp('').strip
        item.oligo_value = "unknown"
        item.fruktose_value = "unknown"
        item.polyol_value = "unknown"
        item.laktose_value = "unknown"
        ingredient_info.push(item)
      end
    end

    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods']= 'POST, GET, OPTIONS, PUT'
    response.headers['Accept']= 'application/json'
    response.headers['content-type']= 'application/json'

    if ingredient_info.blank?
      render json: {error: "Ingredient not found"}, status: 404 and return
    end

    ingredient_array = Array.new

    ingredient_info.each do |ingredient|
      ingredient_array.push(ingredient.attributes)
    end

    puts ingredient_array

    render json: ingredient_array
  end

  def addingredientsconsumerdatabase
    food = params[:food]
    symptoms_or_not = params[:symptoms]

    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods']= 'POST, GET, OPTIONS, PUT'
    response.headers['Accept']= 'application/json'
    response.headers['content-type']= 'application/json'

    ingredient = UserTestedIngredient.where(food: food).first
    if !ingredient.blank?
      ingredient.users_with_symptoms += 1 unless symptoms_or_not
      ingredient.users_without_symptoms += 1 if symptoms_or_not

      ingredient.save
      render json: {success: "Vote recorded"}
    else


    tested_ingredient = UserTestedIngredient.new
    tested_ingredient.food = food
    tested_ingredient.users_with_symptoms = 0
    tested_ingredient.users_without_symptoms = 0

    tested_ingredient.users_with_symptoms += 1 unless symptoms_or_not
    tested_ingredient.users_without_symptoms += 1 if symptoms_or_not

    tested_ingredient.save

    render json: {success: "Ingredient added"}
    end
  end

  def checkingredientsconsumerdatabase
    text = params[:imageText]
    ingredients = text.split(',')

    ingredient_info = Array.new
    ingredients.each do |ingredient|
      #Fuzzy find by name kan være smart
      info = UserTestedIngredient.where(food: ingredient.chomp('').strip).first
      ingredient_info.push(info) unless info.blank?
    end

    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods']= 'POST, GET, OPTIONS, PUT'
    response.headers['Accept']= 'application/json'
    response.headers['content-type']= 'application/json'

    if ingredient_info.blank?
      render json: {error: "Ingredient not found"}, status: 404 and return
    end

    ingredient_array = Array.new

    ingredient_info.each do |ingredient|
      ingredient_array.push(ingredient.attributes)
    end

    render json: ingredient_array
  end
end
