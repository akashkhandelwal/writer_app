class SessionsController < ApplicationController

	def new
		
	end

	def create
		writer = Writer.find_by_email(params[:session][:email].downcase)
		if writer && !writer.password_digest.nil?
			if writer.authenticate(params[:session][:password]) 
	      sign_in writer
	      redirect_to writer
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
	  else
	  	flash.now[:error] = 'Please register yourself through email invitation sent to you'
	  	render 'home/show'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
