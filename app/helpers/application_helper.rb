module ApplicationHelper

  # This action calculate fine on book
  def fine_calculation(id)
    (Time.now.to_date - BookTransaction.find(id).issue_date.to_date).to_i 
  end
  
  # This action check activate/deactivate status
  def check_current_status(id, model)
    status = model.find(id)
    status.is_active? ? "Deactivate" : "Activate"
  end
  
end
