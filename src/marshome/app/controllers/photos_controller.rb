class PhotosController < ApplicationController

    def create
        @listing = Listing.find(params[:listing_id])

        if params[:images]
            params[:images].each do |img|
                @listing.photos.create(image: img)
            end
            @photos = @listing.photos
            redirect_back(fallback_location: request.referer, notice: "Saved....")
        end
    end

    def destroy
        @photo = Photo.find(params[:id])
        listing = @photo.listing

        @photo.destroy
        @photos = Photo.where(listing_id: listing.id)

        respond_to :js
    end


end
