class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books
  has_many :book_transactions, dependent: :destroy

  # This action search for matched data in table for search action 
  def self.search(search)
    if search
      where("name like ? OR id like ? ", "%#{search}%","%#{search}%")
    end
  end

  # This action prohibited dectivated user from login
  def active_for_authentication?
    super && self.is_active
  end

  # This action set a message for deactivated user.
  def inactive_message
    "Sorry, this account has been deactivated. Please contact to Admin"
  end
end
