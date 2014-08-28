module StudentsHelper
  def check_current_status(id)
    if Student.find(id).is_active?
      "Deactivate"
    else
      "Activate"
    end
  end
end
