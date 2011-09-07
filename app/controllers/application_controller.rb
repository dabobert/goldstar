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
    heart
  end

  def heart
    #the heart character is displayed wierd in text mate, which is why i use the entity. ♥
    #i don't trust raw special chars in all enviorments, editors, ides's and os's
    @heart ||= "&#9829;"
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
  
  def get_twitter_keys
    @twitter_config = YAML.load(File.read(Rails.root.join('config', 'twitter.yml')))[Rails.env]
  end
end
