class StudentsController < ApplicationController

  # This action show all students list
  def index
    @students = Student.all 
  end

  # This action create a new student object
  def new
    @student = Student.new
  end

  # This action add a new record in students table when admin add any new student
  def save
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_url
    else
      render "new"
    end 
  end

  # This action show a student information
  def show
    @student = Student.find(params[:id]) 
    @student_books = BookTransaction.where(student_id: @student.id).where(return_date: nil) 
  end

  # This action permit all accessible attributes
  def student_params
    params.require(:student).permit(:name, :email, :phone_no, :password, :password_confirmation)
  end

end
