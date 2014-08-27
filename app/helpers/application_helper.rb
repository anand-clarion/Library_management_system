module ApplicationHelper

  # This action calculate fine on book
  def fine_calculation(id)
    (Time.now.to_date - BookTransaction.find(id).issue_date.to_date).to_i 
  end
  
end
