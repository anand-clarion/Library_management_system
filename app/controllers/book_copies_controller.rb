class BookCopiesController < ApplicationController

  # This action show a book copy information.
  def show
    @book_copy = BookCopy.find(params[:id])
  end
end
