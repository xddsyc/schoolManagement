class SclassesController < ApplicationController

	# breadcrumb 'Home', sclasses_path

	def index
		@sclasses = Sclass.all
	end

	def new
		@sclass = Sclass.new
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

		# breadcrumb  @sclass.id, sclass_path(@sclass)
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
