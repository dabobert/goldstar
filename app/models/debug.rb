class Debug < ActiveRecord::Base
  
  def self.kill_empty_profiles
    Profile.all.each do |profile|
      profile.destroy if profile.email_addresses.blank?
    end
  end
  

  
  def self.tw array
    array.each do |tweet|
      #source_id = tweet.id_str.to_s(36)
        star = Star.create! :description=>tweet.text, :poster=>tweet.from_user, :recipient=>nil,
                :source_id=>tweet.id_str, :source_type=>"twitter"
    end
  end
end
