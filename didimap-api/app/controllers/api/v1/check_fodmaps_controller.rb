class Api::V1::CheckFodmapsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def checkingredients
    puts "IN API FUNCTION"
    text = params[:imageText]
    #puts text

    ingredients = text.split(/\W+/)
    puts ingredients

    low = Array.new
    moderate = Array.new
    high = Array.new
    none = Array.new

    ingredient_info = Array.new
    ingredients.each do |ingredient|
      #Fuzzy find by name kan være smart
      info = FoodItem.where(food: ingredient).first
      ingredient_info.push(info)
    end

    puts ingredient_info[0].attributes.values[1]


    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods']= 'POST, GET, OPTIONS, PUT'
    response.headers['Accept']= 'application/json'
    response.headers['content-type']= 'application/json'
    render json: {
        ingredients: {
            foood:          'Agavenektar',
            desc:           '',
            oligo_value:    'info.oligo_value',
            fruktose_value: 'info.fruktose_value',
            polyol_value:   'info.polyol_value',
            laktose_value:  'info.laktose_value'
        }
    }

  end
end
