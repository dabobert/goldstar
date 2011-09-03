class Debug < ActiveRecord::Base
  
  def self.kill_empty_profiles
    Profile.all.each do |profile|
      profile.destroy if profile.email_addresses.blank?
    end
  end
  
  def self.echo_log str
    logger.debug str
    puts str
    str
  end

end
