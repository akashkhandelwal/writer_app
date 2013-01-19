class WriterMailer < ActionMailer::Base
  default from: "from@example.com"

  def invitation_mail(writer)
  	@writer = writer
  	mail to: writer.email, subject: 'Invitation for sign up'
  end
end
