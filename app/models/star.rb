class Star < ActiveRecord::Base
  attr_accessor :recipient, :poster
  
  belongs_to :sender, :class_name=>"Profile"
  belongs_to :receiver, :class_name=>"Profile"
  belongs_to :sender_network, :class_name=>"Network"
  belongs_to :receiver_network, :class_name=>"Network"
  
  validates_presence_of :description
  validates_uniqueness_of :source_id, :scope => :source_type
  
  after_initialize :set_recipient
  after_save :set_star_source
  
  scope :descending, order("id desc")
  
  def owned_by? profile
    [receiver,sender].include? profile
  end
  
  
  def sender_str
    case self.sender_network.name
    when "goldstar": self.sender.email_addresses.first
    when "twitter": "@"+self.sender.social_media_accounts.where(:network_id=>self.sender_network_id).first.username
    else raise "can not display sender_str for star:#{self.id}"
    end
  end
  
  
  def receiver_str
    return self.misc if self.receiver_id.blank?
    
    case self.receiver_network.name
    when "goldstar"
      self.receiver.email_addresses.first
    when "twitter"
      "@"+self.receiver.social_media_accounts.where(:network_id=>self.receiver_network_id).first.username
    when "none"
      self.misc
    else
      raise "can not display receiver_str for star:#{self.id}"
    end
  end
  
  
  def set_recipient
    @init = true
    self.recipient = @stash if self.new_record? #and not(@stash.blank?)
  end
  
  
  def recipient= value
    if @init
      if self.source_type != "goldstar" and value.blank?
        #what we do when the receiver of the goldstar is not a "real" person
        #self.receiver = Profile.construct("none", "none")
        self.misc = "@object"
      else
        self.receiver = Profile.construct(value, self.source_type)
      end
    else
      #stash the value, so it can be used once @init is set
      @stash = value
    end
  end
  
  private 
  
  def set_star_source
    self.update_attribute(:source_id, self.id) if self.source_id.blank? and self.source_type == "goldstar"
  end

    
end
