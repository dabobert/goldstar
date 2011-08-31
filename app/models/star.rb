class Star < ActiveRecord::Base
  attr_accessor :recipient, :poster
  
  belongs_to :sender, :class_name=>"Profile"
  belongs_to :reciever, :class_name=>"Profile"
  
  validates_presence_of :description
  
  scope :descending, order("id desc")
  
  def owned_by? profile
    [reciever,sender].include? profile
  end
  
  def sender_str
    self.sender.email_addresses.first
  end
  
  def reciever_str
    self.reciever.email_addresses.first
  end
  
  def recipient= value
    self.reciever = Profile.construct(value)
  end
end
