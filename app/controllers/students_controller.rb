class StudentsController < ApplicationController
	def index
		@students = Student.order('id desc').page(params[:page]).per(5)
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)

		if @student.save
			redirect_to @student
		else
			render 'new'
		end
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])

		if @student.update(student_params)
			redirect_to @student
		else
			render 'edit'
		end
	end

	def show
		@student = Student.find(params[:id])
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		redirect_to students_path
	end

	private 
		def student_params
			params.require(:student).permit(:no, :name, :sclass_id)
		end
end
