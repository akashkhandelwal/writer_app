class Writer < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :screen_name, :password, :password_confirmation
  has_secure_password

  before_save :create_remember_token
  before_save :create_invitation_token

  def save_emails(email_list)
  	email_ids = email_list.split(',')
		email_ids.each do |email|
			new_writer = Writer.new(email: email)
			new_writer.save!(validate: false)
		end
  end

  private
  	
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end

  	def create_invitation_token
  		self.invitation_token = SecureRandom.urlsafe_base64
  	end
end
