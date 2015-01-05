class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize
  protect_from_forgery with: :exception

  before_action :set_date_loaded

  private
  def set_date_loaded
    @date_loaded = Time.now
  end

  protected
  	def authorize
  		unless User.find_by(id:session[:user_id])
  			redirect_to login_url, notice: "Place log in"
  		end
  	end
end
