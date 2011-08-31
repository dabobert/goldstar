class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  belongs_to :profile
  
  after_save :create_profile
  
  validates_presence_of :email
  
  private
  
  def create_profile
    self.build_profile
    self.profile.save
    self.profile.email_addresses.create :value=> self.email
    self.profile
  end
end
