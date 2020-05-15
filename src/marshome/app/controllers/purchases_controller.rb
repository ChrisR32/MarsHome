class PurchasesController < ApplicationController
    before_action :authenticate_user!


    def create
        listing = Listing.find(params[:listing_id])
        if current_user == listing.user
            flash[:alert] = "You can't purchase your own property"
        elsif listing.sold == true
            flash[:alert] = "This property has been sold"
        else
            @purchase = current_user.purchases.build(purchase_params)
            if @purchase.term?
                @purchase.listing = listing
                @purchase.price = listing.price
                @purchase.save
                listing.update_attribute(:sold, true)
                listing.update_attribute(:active, false)
                flash[:notice] = "You have purchased this property"
            else
                flash[:alert] = "Unable to purchase without accepting the Terms and Conditions." 
            end
        end
    redirect_to listing
    end

    def your_purchases
        @your_purchases = current_user.purchases.order(created_at: :asc)
    end

    def your_sold
        @listings = current_user.listings
    end

    private
        def purchase_params
            params.require(:purchase).permit(:term)
        end

end