class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

	include SessionsHelper
  	def new
  		if current_user
  			redirect_to sclasses_path
  		else
  			@user = User.new
  		end
 	end

  	def create
  		user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])

  		if user
  			login_in(user)
  			redirect_to sclasses_path
  		else
  			flash.now[:danger] = '用户名或密码错误'
  			render 'new'
  		end
  	end

  	# 退出登录
  	def destroy
  		log_out if logged_in?
  		redirect_to login_path
  	end

  	private
  		def user_params
  			params.require(:session).permit(:name, :password)
  		end
end
