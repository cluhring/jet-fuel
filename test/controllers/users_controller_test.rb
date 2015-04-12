require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = User.new(first_name: "Lauren",
                     last_name: "Luhring",
                     email: "lespath@gmail.com",
                     phone: "2606025739",
                     country_code: "1",
                     password: "valid",
                     id: 1)
  end

  def teardown
    @user.destroy
  end

  test "should get new" do
    get :new
    assert_response :success
    assert assigns(:user)
    assert assigns(:user).new_record?
  end

end
