class Writer < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :screen_name, :password, :password_confirmation
  has_secure_password

  before_save :create_remember_token

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
