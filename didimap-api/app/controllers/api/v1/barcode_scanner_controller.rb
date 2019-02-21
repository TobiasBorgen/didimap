class Api::V1::BarcodeScannerController < ApplicationController
skip_before_action :verify_authenticity_token

	def scanbarcode
		response.headers['Access-Control-Allow-Origin'] = '*'
		response.headers['Access-Control-Allow-Methods']= 'POST, GET, OPTIONS, PUT'
		response.headers['Accept']= 'application/json'
		response.headers['content-type']= 'application/json'

		text = params[:imageText]
		result = FoodProduct.where(gtin: text).first
		if !result.blank?
			render json: result
		else
			render json: {error: "Product not found"}, status: 404
		end
	end
end
