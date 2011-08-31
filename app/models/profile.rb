class Profile < ActiveRecord::Base
  
  has_many :sent_stars, :class_name=>"Star", :foreign_key=>"sender_id"
  has_many :recieved_stars, :class_name=>"Star", :foreign_key=>"reciever_id"
  
  has_one  :user
  has_many :email_addresses
  
  def self.construct value
    User.find_by_email(value)  
  end
  
end
