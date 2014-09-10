class StudentsController < ApplicationController

  # This action show all students list
  def index
    @students = Student.where.not(id: current_student.id).paginate(:page => params[:page], :per_page => 6) 
  end

  # This action create a new student object
  def new
    @student = Student.new
  end

  # This action add a new record in students table when admin add any new student
  def save
    @student = Student.new(student_params)
    if @student.save
      StudentMailer.welcome_email(@student).deliver
      redirect_to students_url
    else
      render "new"
    end 
  end

  # This action show a student information
  def show
    @student = Student.find(params[:id]) 
    @books_assigned_to_student = @student.book_transactions.where(return_date: nil) 
  end

  # This action edit a student information.
  def edit
    @student = Student.find(params[:id])
  end

  # This action update a student information
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:notice] = "student's information successfully updated"
      redirect_to students_url
    else
      render "edit"
    end
  end

  # This action return data for search
  def search
    if !params[:search].empty?
      @search_student = Student.search(params[:search])
      @search_book = Book.search(params[:search])
      @search_copy = BookCopy.search(params[:search])
    else
      flash[:notice] = "Cant search for empty string"
      redirect_to students_url
    end
  end

  # This action permit all accessible attributes
  def student_params
    params.require(:student).permit(:name, :email, :phone_no, :password, :password_confirmation, :avatar, :avatar1)
  end

end
