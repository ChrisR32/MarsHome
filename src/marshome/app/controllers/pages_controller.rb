class PagesController < ApplicationController
  def home
    @listings = Listing.where(active: true).all
  end

  def search
 
    @listing_city = Listing.where(active: true).all
    @search = @listing_city.ransack(params[:q])
    @listings = @search.result
    @arrListings = @listings.to_a
 


  end
end
