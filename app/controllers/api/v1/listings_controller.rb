class Api::V1::ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render json: {status: 'SUCCESS', message: 'Loaded listings', data:@listings}, status: :ok
  end

  def show
    @listing = Listing.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded listing', data:@listing}, status: :ok
  end

  def create
    @listing = Listing.new(listings_params)

   if @listng.save
    render json: {status: 'SUCCESS', message: 'Listing created', data:@listing}, status: :ok
   else
    render json: {status: 'Error', message: 'Listing is not saved', data:@listing.errors}, status: :unprocessable_entity
   end

  end

  private

  def listings_params
    params.require(:listing).permit(:num_rooms, :listing_id)
  end
end
