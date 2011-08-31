class StarsController < ApplicationController
  
  def new
    @star = Star.new
  end
  
  def create
    #star"=>{"recipient"=>"bobert@gmail.cm", "description"=>"for hanging in there"}}
    begin
      @star = Star.new 
    rescue ActiveRecord::RecordInvalid
    end
  end
  
  def index
  end
end
