class Network < ActiveRecord::Base
  #it seems a mysql db can not have a table named networks
  set_table_name "interweb_networks"
  has_many :social_media_accounts
  
  validates_uniqueness_of :name
  validates_presence_of :name
end
