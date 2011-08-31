class Profile < ActiveRecord::Base
  
  has_many :sent_stars, :class_name=>"Star", :foreign_key=>"sender_id"
  has_many :recieved_stars, :class_name=>"Star", :foreign_key=>"reciever_id"
  
  has_one  :user
  has_many :email_addresses
  
  def self.construct value
    EmailAddress.seek_profile(value) || Profile.construct_via_email!(value)
  end
  
  def self.construct_via_email!(value)
    profile = Profile.create!
    profile.email_addresses.create! :value=> value
    profile
  end
  
end
