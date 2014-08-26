class BookTransactionsController < ApplicationController

  # This action show all book_transactions
  def index
    @book_transactions = BookTransaction.all
  end

  # This action created a new book_transaction instance  
  def new
    @book_transaction = BookTransaction.new
  end

  # This actions added a new record in book_transaction table
  def create
    @book_transaction = BookTransaction.new(book_transaction_params)
    @book_transaction.issue_date = Time.now
    if @book_transaction.save
      flash[:notice] = "Transaction saved successfully"
      redirect_to book_transactions_url
    else
      render "new"
    end
  end

  # This action edit a book_transaction's inforamation
  def edit
    @book_transaction = BookTransaction.find(params[:id])
  end

  # This action update a book_transaction's information
  def update
    @book_transaction = BookTransaction.find(params[:id])
    if @book_transaction.update_attributes(return_date: Time.now)
      flash[:notice] = "Transaction information successfully updated"
      redirect_to book_transactions_url
    else
      render "edit"
    end
  end

  # This action permit all accessible attributes
  def book_transaction_params
    params.require(:book_transaction).permit(:student_id, :book_id, :issue_date, :return_date, :fine)
  end

end

