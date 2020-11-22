class SessionsController < ApplicationController
  layout 'base'
  def new
  	@user = User.new
  end

  def create
  	user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])

  	if user
  		redirect_to sclasses_path
  	else
  		flash.now[:login_error] = '无效的用户名'
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:session).permit(:name, :password)
  	end
end
