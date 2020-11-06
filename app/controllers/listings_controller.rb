class ListingsController < ApplicationController

    def index
        listings = Listing.all
        render json: listings
    end

    def show
        listing = Listing.find_by(name: params[:name])
        render json: listing
    end

    def create
        listing = Listing.new(listing_params)
        listing.save

        render json: listing
    end

    def update
        listing = Listing.find(params[:id])
        listing.update(listing_params)
        render json: listing
    end

    def destroy
        listing = Listing.find(params[:id])
        listing.destroy
        render json: {message: 'Successfully deleted'}
    end

    private

    def listing_params
        params.require(:listing).permit(:title, :rating, :description, :price, :image_url, :user_id)
    end

end
