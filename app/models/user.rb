class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :favorites
  has_many :favorite_stars, :through=>:favorites, :source=>:star
  
  belongs_to :profile
  
  before_save :create_profile
  
  validates_presence_of :email
  
  def is_favorite? star
    @favorite_stars ||= self.favorite_stars
    self.favorite_stars.include? star
  end
  
  
  
  private
  
  def create_profile
    if self.profile.blank?
      self.profile = Profile.construct self.email
    end
    self.profile
  end
end
