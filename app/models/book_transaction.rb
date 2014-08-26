class BookTransaction < ActiveRecord::Base
  belongs_to :student
  belongs_to :book

  validate :book_count_within_limit, :on => :create

  # This action set a limit for maximum book issued for a student
  def book_count_within_limit
    if self.student.book_transactions.where(:return_date => nil).count >= 3
      errors.add(:base, "Student can borrow maximum 3 book at a time")
    end
  end
end
