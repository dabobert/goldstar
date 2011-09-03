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
    #puts self.inspect
    logger.debug("stash: #{@stash}")
    logger.debug("new: #{self.new_record?}")
    logger.debug("recipient: #{self.recipient}")
    self.recipient = @stash if self.new_record? #and not(@stash.blank?)
    logger.debug("reciever: #{self.receiver.id}")
  end
  
  
  def recipient= value
    if @init
      logger.debug "after init-value: #{value}"
      logger.debug "source type: #{self.source_type}"
      if self.source_type != "goldstar" and value.blank?
        #self.receiver = Profile.construct("none", "none")
        self.misc = "subject goes here"
      else
        self.receiver = Profile.construct(value, self.source_type)
      end
    else
      @stash = value
      logger.debug "stashing #{@stash}"
    end
  end
  
  private 
  
  def set_star_source
    self.update_attribute(:source_id, self.id) if self.source_id.blank? and self.source_type == "goldstar"
  end

    
end
