class Star < ActiveRecord::Base
  attr_accessor :recipient, :poster
  
  belongs_to :sender, :class_name=>"Profile"
  belongs_to :receiver, :class_name=>"Profile"
  
  validates_presence_of :description
  
  after_save :set_star_source
  
  scope :descending, order("id desc")
  
  def owned_by? profile
    [receiver,sender].include? profile
  end
  
  def sender_str
    self.sender.email_addresses.first
  end
  
  def receiver_str
    self.receiver.email_addresses.first
  end
  
  def recipient= value
    self.receiver = Profile.construct(value, self.source_type)
  end
  
  private 
  
  def set_star_source
    self.update_attribute(:source_id, self.id) if self.source_id.blank? and self.source_type == "goldstar"
  end

    
end
