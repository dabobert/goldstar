class StarsController < ApplicationController
  #before_filter :authenticate_user!
  
  def new
    @star = Star.new
  end
  
  def create
    @star = Star.new params[:star]
    #star"=>{"recipient"=>"bobert@gmail.cm", "description"=>"for hanging in there"}}
    logger.debug "shoudl be #{current_user.profile.id}"
    begin
      if user_signed_in?
        @star.sender = current_user.profile
      else
        @star.sender = Profile.construct_via_email!(params[:sender])
      end
      @star.save!
      flash[:notice] = "You have given #{@star.reciever_str} a Gold Star!"

      redirect_to stars_path
    rescue ActiveRecord::RecordInvalid
      render :action=>:new
    end
  end
  
  def index
    if params[:user_id].blank?
      @prefix = "All"
      @stars = Star.descending
    else
      @prefix = "My"
      @stars = current_user.profile.stars
    end
  end
end
