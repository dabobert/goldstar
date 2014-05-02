class Network < ActiveRecord::Base
  #it seems a mysql db can not have a table named networks
  self.table_name = "interweb_networks"
  has_many :social_media_accounts
  
  validates_uniqueness_of :name
  validates_presence_of :name
end
