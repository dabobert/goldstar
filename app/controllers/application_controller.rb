class ApplicationController < ActionController::Base
  protect_from_forgery
  



  protected
  
  def store_page
    session[:return_to] ||= request.referer
  end
end
