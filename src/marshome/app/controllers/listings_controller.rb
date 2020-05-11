class ListingsController < ApplicationController
    before_action :set_listing, except: [:index, :new, :create]
    before_action :authenticate_user!, except: [:show]
    before_action :is_authorised, only: [:post, :pricing, :description, :photo_upload, :ammenities, :location, :update]
  
    def index
      @listings = current_user.listings
    end
  
    def new
      @listing = current_user.listings.build
    end
  
    def create
      @listing = current_user.listings.build(listing_params)
      if @listing.save
        redirect_to post_listing_path(@listing), notice: "Saved..."
      else
        flash[:alert] = "Invalid seletion, please try again..."
        render :new
      end
    end

    def show
    end
  
    def post
    end
  
    def pricing
    end
  
    def description
    end
  
    def photo_upload
      @photos = @listing.photos
    end
  
    def amenities
    end
  
    def location
    end
  
    def update
    
        new_params = listing_params # these 2 lines stop people inspecting the code on publish button and tricking it into commiting
        new_params = listing_params.merge(active: true) if is_listing_complete

      if @listing.update(new_params)
        flash[:notice] = "Saved..."
      else
        flash[:alert] = "Invalid seletion, please try again..."
      end
      redirect_back(fallback_location: request.referer)
    end
  
  private_methods
  def set_listing
    @listing = Listing.find(params[:id])
  end
  
  def is_authorised
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @listing.user_id
  end
  
  def is_listing_complete
    !@listing.active && !@listing.title.blank? && !@listing.bed_room.blank? && !@listing.address_zone.blank? && !@listing.photos.blank? && !@listing.price.blank?
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :bed_room, :bath_room, :parking_space, :living_area, :air_conditioning, :heating, :yard, :smart_system, :price, :address_number, :address_street, :address_zone, :address_city, :active, :image)
  end
  
end
