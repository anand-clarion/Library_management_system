class Book < ActiveRecord::Base
  has_many :book_copies, dependent: :destroy
  has_many :book_transactions, dependent: :destroy
  after_create :create_book_copies
  before_update :update_book_copies

  # This action create book_copies records for new book
  def create_book_copies
    book = self.id
    copy = self.no_of_copy
    copy.times do 
      book_copy = BookCopy.new(book_id: book)
      book_copy.save!
    end
  end

  # This action update book_copy records of any book after book information updation 
  def update_book_copies
    if self.no_of_copy_changed?
      book_id = self.id
      new_no_of_copy = self.no_of_copy
      old_no_of_copy = self.no_of_copy_was
      difference_in_copy = new_no_of_copy - old_no_of_copy
      if difference_in_copy > 0
        difference_in_copy.times do 
          book_copy = BookCopy.new(book_id: book_id)
          book_copy.save!
        end
      elsif BookCopy.where(book_id: book_id).where(is_assigned: false).count >= difference_in_copy.abs 
        book = BookCopy.where(book_id: book_id).where(is_assigned: false).last(difference_in_copy.abs) 
        BookCopy.destroy(book)
      else
        errors.add(:base, "The book are already assigned")
      end 
    end
  end

end
