class BookCopy < ActiveRecord::Base
  belongs_to :book
  scope :unassigned_copies, -> { where(is_assigned: false) }

  # This action search for matched data in table for search action 
  def self.search(search)
    if search
      where("id like ?", "#{search}")
    end
  end

end
