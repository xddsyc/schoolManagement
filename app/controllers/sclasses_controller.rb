class SclassesController < ApplicationController

	breadcrumb '班级管理', :sclasses_path, match: :exact

	def index
		@sclasses = Sclass.order('id desc').page(params[:page]).per(5)
	end

	def new
		@sclass = Sclass.new

		breadcrumb '新增班级', :new_sclass_path
	end

	def create
		@sclass = Sclass.new(sclass_params)

		if @sclass.save
			redirect_to @sclass
		else
			render 'new'
		end
	end

	def edit
		@sclass = Sclass.find(params[:id])

		breadcrumb @sclass.id.to_s, edit_sclass_path(@sclass)
		breadcrumb '编辑', edit_sclass_path(@sclass)
	end

	def update
		@sclass = Sclass.find(params[:id])

		if @sclass.update(sclass_params)
			redirect_to @sclass
		else
			render 'edit'
		end
	end

	def show
		@sclass = Sclass.find(params[:id])

		breadcrumb @sclass.id.to_s, sclass_path(@sclass)
	end

	def destroy
		@sclass = Sclass.find(params[:id])
		@sclass.destroy

		redirect_to sclasses_path
	end

	private 
		def sclass_params
			params.require(:sclass).permit(:grade_name,:class_name)
		end
end
