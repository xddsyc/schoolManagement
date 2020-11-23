class ApplicationController < ActionController::Base
	include SessionsHelper
	breadcrumb '首页', :root_path
	before_action :require_login
  private
	  def require_login
	    unless logged_in?
	      flash[:danger] = "必须登陆才能使用"
	      redirect_to login_url # halts request cycle
	    end
	  end
end
