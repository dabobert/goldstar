class Favorite < ActiveRecord::Base
  belongs_to :star
  belongs_to :user
end
