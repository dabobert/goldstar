class Star < ActiveRecord::Base
  attr_accessor :recipient
  
  belongs_to :sender, :class_name=>"Profile"
  belongs_to :reciever, :class_name=>"Profile"
  
  validates_presence_of :recipient
  validates_presence_of :description
  
  def recipient= value
    puts "ha!"
  end
end
