class SessionsController < ApplicationController

	def new
		
	end

	def create
		writer = Writer.find_by_email(params[:session][:email].downcase)
    if writer && writer.authenticate(params[:session][:password]) 
	      sign_in writer
	      redirect_to writer
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
