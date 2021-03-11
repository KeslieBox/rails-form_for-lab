class StudentsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        # binding.pry 
        # @student = Student.create(first_name: params[:first_name], last_name: params[:last_name])
        @student = Student.create(params.require(:student).permit(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    def show
        @student = Student.find_by(id: params[:id])
    end

    def edit
        @student = Student.find_by(id: params[:id])
    end

    def update
        @student = Student.find_by(id: params[:id])
        @student = Student.update(params.require(:student).permit(:first_name, :last_name))
        redirect_to student_path(@student)
    end
end