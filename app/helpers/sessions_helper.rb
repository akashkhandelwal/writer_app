module SessionsHelper

	def sign_in(writer)
    cookies.permanent[:remember_token] = writer.remember_token
    self.current_writer = writer
  end

  def signed_in?
  	!current_writer.nil?
  end

  def current_writer=(writer)
  	@current_writer = writer
  end

  def current_writer
  	@current_writer ||= Writer.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_writer = nil
    cookies.delete(:remember_token)
  end
end
