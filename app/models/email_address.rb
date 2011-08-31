class EmailAddress < ActiveRecord::Base
  belongs_to :profile
  
  validates :value, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  def to_s
    self.value
  end
  
  def self.seek_profile value
    email = EmailAddress.find_by_value(value)
    email.profile unless email.blank?
  end
end