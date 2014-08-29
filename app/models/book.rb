class Book < ActiveRecord::Base
  has_many :book_copies, :dependent => :restrict_with_error
  has_many :book_transactions, dependent: :destroy
  validates :no_of_copy, presence: true
  after_create :create_book_copies
  validate :update_book_copies, on: :update

  # This action create book_copies records for new book
  def create_book_copies
    self.no_of_copy.times do 
      book_copy = BookCopy.new(book_id: self.id)
      book_copy.save!
    end
  end

  # This action update book_copy records of any book after book information updation 
  def update_book_copies
    if self.no_of_copy_changed?
      difference_in_copy =  self.no_of_copy - self.no_of_copy_was
      if difference_in_copy > 0
        difference_in_copy.times do 
          book_copy = BookCopy.new(book_id: self.id)
          book_copy.save!
        end
      elsif self.book_copies.unassigned_copies.count >= difference_in_copy.abs 
        book = self.book_copies.unassigned_copies.last(difference_in_copy.abs) 
        BookCopy.destroy(book)
      else
        errors.add(:base, "Can't update book copies The book are already assigned")
      end 
    end
  end

end
