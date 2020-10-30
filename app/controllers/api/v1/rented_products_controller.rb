module Api::V1
    class RentedProductsController < ApplicationController

        def index
            rented_products = RentedProduct.all
            render json: rented_product
        end

        def show
            rented_product = RentedProduct.find_by(name: params[:name])
            render json: rented_product
        end

    end
end
