# 后台用户管理
class UsersController < ApplicationController 
  breadcrumb '用户管理', :users_path, match: :exact
  def index
	@users = User.order('id desc').page(params[:page]).per(5)
  end

  def new
  	@user = User.new
    breadcrumb '新增用户', :new_user_path
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])

    breadcrumb @user.name, user_path(@user)
    breadcrumb '编辑', user_path(@user)
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def destroy
  	@user = User.find(params[:id])

  	@user.destroy
    redirect_to users_path
  end

  def show
  	@user = User.find(params[:id])

    breadcrumb @user.name, user_path(@user)
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :password, :password_confirmation)
  	end

end
