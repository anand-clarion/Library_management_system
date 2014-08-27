class BookTransaction < ActiveRecord::Base
  belongs_to :student
  belongs_to :book

  validates :issue_date, presence: true
  validates :return_date, presence: true, :on => :update
  validate :book_count_within_limit, :on => :create
  validate :check_book_availability, on: :create
  after_create :update_book_copy_status_to_assigned
  after_update :update_book_copy_status_to_unassigned

  # This action set a limit for maximum book issued for a student
  def book_count_within_limit
    if self.student.book_transactions.where(:return_date => nil).count >= 3
      errors.add(:base, "Student can borrow maximum 3 book at a time")
    end
  end

  # This action check book availability to issue book to a student
  def check_book_availability
    if BookCopy.where(book_id: self.book_id).where(is_assigned: false).count < 1
      errors.add(:base, "Book out of stock")
    end
  end

  # This action update book_copy status after book issued to any student
  def update_book_copy_status_to_assigned
    book_copy = BookCopy.where(book_id: self.book_id).where(is_assigned: false).first
    book_copy.update_attributes(is_assigned: true)
  end

  # This action update book_copy status after book return by any student
  def update_book_copy_status_to_unassigned
    book_copy = BookCopy.where(book_id: self.book_id).where(is_assigned: true).last
    book_copy.update_attributes(is_assigned: false)
  end

end
