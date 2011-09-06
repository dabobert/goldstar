class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    begin 
      current_user.favorites.create :star_id=>params[:star_id]
      flash[:success] = "You have favorited a #{gold_star}"
      redirect_to request.referer
    rescue ActiveRecord::RecordInvalid
      redirect_to request.referer
    end
  end
end
