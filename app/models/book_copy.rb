class BookCopy < ActiveRecord::Base
  belongs_to :book
  scope :unassigned_copies, -> { where(is_assigned: false) }
end
