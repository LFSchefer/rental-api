class Api::V1::ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :update, :destroy]

  def index
    @listings = Listing.all
    render json: {status: 'SUCCESS', message: 'Loaded listings', data:@listings}, status: :ok
  end

  def show
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

  def update
    if @listing.update(listing_params)
      render json: @listing
    else
      render json: { error: 'Unable to update listing.' }, status: 400
    end

  end

  def destroy
    @listing.destroy
    render json: {status: 'SUCCESS', message: 'Listing destroy', data:@listing}, status: :ok
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listings_params
    params.require(:listing).permit(:num_rooms, :listing_id)
  end
end
