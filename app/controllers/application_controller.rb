class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_student!
  alias_method :current_user, :current_student

  # This action for deactivation process 
  def deactivate
    @deactivate = params[:table_name].constantize.find(params[:id])
    @deactivate.is_active = 0
    @deactivate.save
    redirect_to students_url
  end

  # This action for activatation process
  def activate
    @activate = params[:table_name].constantize.find(params[:id])
    @activate.is_active = 1
    @activate.save
    redirect_to students_url
  end
end
