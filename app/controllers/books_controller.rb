class BooksController < ApplicationController

  # This action show all books
  def index
    @books = Book.all
  end

  # This action created a new book's instance  
  def new
    @book = Book.new
  end

  # This actions added a new record in books table
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book record successfully created"
      redirect_to books_url
    else
      render "new"
    end
  end

  # This action edit a book inforamation
  def edit
    @book = Book.find(params[:id])
  end

  # This action update a book information
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book's information successfully updated"
      redirect_to books_url
    else
      render "new"
    end
  end

  # This actoin delete a record from books table
  def destroy
    Book.find(params[:id]).destroy
    flash[:notice] = "Book successfully destroyed"
    redirect_to books_url
  end

  # This action permit all accessible attributes
  def book_params
    params.require(:book).permit(:title, :author, :no_of_copy, :issue_date, :return_date, :fine)
  end

end
