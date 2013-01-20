class Writer < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :screen_name, :password, :password_confirmation
  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :screen_name
  validates_presence_of :gender

  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: 	{ with: VALID_EMAIL_FORMAT },
  									presence: true, uniqueness: { case_sensitive: false }

  validates :password, confirmation: true, length: { minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  before_save :create_remember_token
  before_save :create_invitation_token

  def save_emails(email_list)
  	email_ids = email_list.split(',')
		email_ids.each do |email|
      writer = Writer.find_by_email(email)
      if writer
        WriterMailer.invitation_mail(writer).deliver
      else
  			new_writer = Writer.new(email: email)
  			new_writer.save!(validate: false)
  			WriterMailer.invitation_mail(new_writer).deliver
      end
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
