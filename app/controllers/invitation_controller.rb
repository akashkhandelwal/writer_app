class InvitationController < ApplicationController
  def new
  end

  def create
  	email_list = params[:invitation][:email_list]
  	current_writer.save_emails(email_list)
  	redirect_to root_url, notice: 'Invitation sent successfully...!!!!'
  end
end
