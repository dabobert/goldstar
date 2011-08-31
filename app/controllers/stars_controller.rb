class StarsController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :store_page, :only=>:index
  
  def new
    @star = Star.new
  end



  
  def create
    @star = Star.new params[:star]
    #star"=>{"recipient"=>"bobert@gmail.cm", "description"=>"for hanging in there"}}
    begin
      if user_signed_in?
        @star.sender = current_user.profile
      else
        @star.sender = Profile.construct(params[:star][:poster])
      end
      @star.save!
      flash[:success] = "You gave a #{@gold_star} to #{@star.reciever_str}"

      redirect_to stars_path
    rescue ActiveRecord::RecordInvalid
      render :action=>:new
    end
  end



  
  def destroy
    Star.connection.delete("DELETE FROM stars WHERE id=#{params[:id]}")
    flash[:notice] = "You took back the ★  :("
    
    if session[:return_to].blank?
      redirect_to user_stars_path(current_user)
    else
      redirect_to session[:return_to]
    end
  end
  
  def index
    if params[:user_id].blank?
      @mode = "all"
      @stars = Star.descending
    else
      @mode = "My"
      @stars = current_user.profile.stars
    end
  end
end
