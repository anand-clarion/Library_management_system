require 'test_helper'
include Devise::TestHelpers
load "#{Rails.root}/app/models/student.rb"

class StudentsControllerTest < ActionController::TestCase
  test "the truth" do
    # assert_equal '$2a$04$Mg39VaIIttb5TJlhDZWhb.3jHZJ4HuFweQClHROK17aSiNyNFzCAa', students(:one).encrypted_password, "Not same"
    # @student = students(:one)
    # @request.env["devise.mapping"] = Devise.mappings[:student]
    # sign_in :one
    # sign_in user: {email: students(:one).email, password: students(:one).encrypted_password }
    # assert_response :success
    # assert_equal 'signed', flash[:notice]
    # get :index
    # assert_equal "signed", flash[:notice]
    sign_in students(:one)
    get :index
    assert_response :success
    assert_equal "signed", flash[:notice]
  end

    # student = Student.new(email: students(:one).email,   encrypted_password: students(:one).encrypted_password)
    # student = Student.new(email: 'admin@gmail.com', password: 'test12345')
    # assert student.save

  test "should create student" do
    assert_difference("Student.count", 1) do
      Student.create(email: 'admin@gmail.com', password: 'test12345')
    end
  end
end
