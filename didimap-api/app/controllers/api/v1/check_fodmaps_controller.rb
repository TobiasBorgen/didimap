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
      ingredient_info.push(info)
    end

    ingredient_array = Array.new

    ingredient_info.each do |ingredient|
      ingredient_array.push(ingredient.attributes)
    end

    puts ingredient_array

    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods']= 'POST, GET, OPTIONS, PUT'
    response.headers['Accept']= 'application/json'
    response.headers['content-type']= 'application/json'
=begin
    render json: {
        ingredients: {
            foood:          ingredient_info[0].attributes.values[1],
            desc:           ingredient_info[0].attributes.values[2],
            oligo_value:    ingredient_info[0].attributes.values[5],
            fruktose_value: ingredient_info[0].attributes.values[6],
            polyol_value:   ingredient_info[0].attributes.values[7],
            laktose_value:  ingredient_info[0].attributes.values[8]
        }
    }
=end

    render json: ingredient_array

  end
end
