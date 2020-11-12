class ProductsController < ApplicationController

    def index
        products = Product.all
        render json: products
    end

    def show
        product = Product.find_by(name: params[:name])
        render json: product
    end

    def create
        product = Product.new(product_params)
        if product.save
            render json: product
        else
            render json: {error: 'Product could not be created'}
        end
    end

    def update
        product = Product.find(params[:id])
        product.update(product_params)
        render json: product
    end

    def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {message: 'Successfully deleted'}
    end

    private

    def product_params
        params.require(:product).permit(:name, :address, :description, :start_time, :end_time, :image_url, :comment, :user_id)
    end

end
