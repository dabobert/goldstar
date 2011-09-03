class SocialMediaAccount < ActiveRecord::Base
  belongs_to :network
  belongs_to :profile
  
  validates_presence_of :username
  validates_presence_of :network_id
  validates_uniqueness_of :username, :scope => :network_id
  
  def self.seek_profile username, network_name
    social_media_account = SocialMediaAccount.where(:username=>username, :network_id=>Network.find_by_name(network_name)).first
    puts "found: #{social_media_account.inspect}"
    social_media_account.profile unless social_media_account.blank?
  end
end
