class Profile < ActiveRecord::Base
  
  has_many :sent_stars, :class_name=>"Star", :foreign_key=>"sender_id"
  has_many :recieved_stars, :class_name=>"Star", :foreign_key=>"receiver_id"
  
  has_one  :user, :dependent=>:destroy, :autosave=>true
  has_many :email_addresses
  
  
  def self.construct(value, network="goldstar")
    case network
    when "goldstar": EmailAddress.seek_profile(value) || Profile.construct_via_email!(value)
    when "twitter": SocialMediaAccount.seek_profile(value, network) || Profile.construct_via_social_media!(value,network)
    else
      raise "no clue how to search/create this profile: #{network}"
    end
  end
  
  
  def self.construct_via_email!(value)
    profile = Profile.create!
    profile.email_addresses.create! :value=> value
    profile
  end
  
  def self.construct_via_social_media(username, network)
     profile = Profile.create!
     profile.social_media_accounts.create! :username=>username, :network=>Network.find_by_name(network)
     profile
  end
  
  def stars
    Star.where("sender_id = ? or receiver_id = ?", self.id, self.id).order("id desc")
  end
  
end
