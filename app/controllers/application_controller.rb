class ApplicationController < ActionController::Base
  before_filter :generate_symbols
  protect_from_forgery
  
  protected
  
  def store_page
    session[:return_to] ||= request.referer
  end
  
  def generate_symbols
    hollow_star
    filled_star
    gold_star
    grey_heart
    red_heart
  end
  
  
  
  def grey_heart
    @grey_heart ||= '<span style="color:grey">&#9829;</span>'
  end
  
  def red_heart
    @red_heart ||= '<span style="color:red">&#9829;</span>'
  end
  
  def hollow_star
    @hollow_star ||= '<span style="color:gold">&#9734;</span>'
  end
  
  def gold_star
    @gold_star ||= filled_star
  end
  
  def filled_star
    @filled_star ||= '<span style="color:gold">&#9733;</span>'
  end
end
