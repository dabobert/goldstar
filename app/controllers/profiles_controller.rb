class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :get_twitter_keys
  
  def show
    @profile = current_user.profile
  end
end