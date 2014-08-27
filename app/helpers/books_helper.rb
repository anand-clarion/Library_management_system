module BooksHelper

  # This action return avialable no of unassigned copy of a book
  def avialable_book_count(id)
    BookCopy.where(book_id: id).where(is_assigned: false).count
  end
end
