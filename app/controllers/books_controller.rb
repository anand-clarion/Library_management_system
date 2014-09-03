class BooksController < ApplicationController

  # This action show all books
  def index
    @books = Book.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)
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

  # This actio show all book copies of a book
  def show
    @book = Book.find(params[:id])
    @book_copies = @book.book_copies.paginate(:page => params[:page], :per_page => 10)
    @transactions = @book.book_transactions.where(return_date: nil)
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
      render "edit"
    end
  end

  # This actoin delete a record from books table
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book successfully destroyed"
      redirect_to books_url
    else
      flash[:notice] = "Can't delete book because of dependent copies assigned"
      redirect_to books_url
    end
  end

  # This action update book copies based on ajax request.
  def update_bookcopies
    @book = Book.find(params[:book_id])
    @transactions = @book.book_transactions.where(return_date: nil)
    if params[:value] == "all"
      @book_copies = @book.book_copies
    elsif params[:value] == "assigned"
      @book_copies = @book.book_copies.where(is_assigned: true)
    else
      @book_copies = @book.book_copies.where(is_assigned: false)
    end
  end
  
  # This action permit all accessible attributes
  def book_params
    params.require(:book).permit(:title, :author, :no_of_copy)
  end

end
