require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @valid_user = User.create(first_name: "Pete",
                             last_name: "Mitchell",
                             email: "maverick@topgun.com",
                             phone: "3035798738",
                             country_code: "1234",
                             password: "valid")
  end

  def teardown
    @valid_user.destroy!
  end

  test "user_is valid" do
    assert @valid_user.valid?
  end

  test "user is invalid without a first name" do
    user = User.create(first_name: "",
                       last_name: "Mitchell",
                       email: "maverick@topguns.com",
                       phone: "3035798738",
                       country_code: "1234",
                       password: "valid")
    assert user.invalid?
  end

  test "user is not valid without a last name" do
    user = User.create(first_name: "Pete",
                       last_name: nil,
                       email: "maverick@topguns.com",
                       phone: "3035798738",
                       country_code: "1234",
                       password: "valid")
    refute user.valid?
  end

  test "user is invalid without a email" do
    user = User.create(first_name: "Pete",
                       last_name: "Mitchell",
                       email: "",
                       phone: "3035798738",
                       country_code: "1234",
                       password: "valid")
    assert user.invalid?
  end

  test "user is invalid with an invalid email" do
    user = User.create(first_name: "Pete",
                       last_name: "Mitchell",
                       email: "maverick.com",
                       phone: "3035798738",
                       country_code: "1234",
                       password: "valid")
     assert user.invalid?
   end

  test "user is invalid without a phone" do
    user = User.create(first_name: "Pete",
                      last_name: "Mitchell",
                      email: "maverick@topguns.com",
                      phone: nil,
                      country_code: "1234",
                      password: "valid")
    assert user.invalid?
  end

  test "user is invalid with an invalid country_code" do
    user = User.create(first_name: "Pete",
                       last_name: "Mitchell",
                       email: "maverick@topguns.com",
                       phone: "3035798738",
                       country_code: "",
                       password: "valid")
     assert user.invalid?
  end

  test "user is invalid with a password" do
    user = User.create(first_name: "Pete",
                       last_name: "Mitchell",
                       email: "maverick@topguns.com",
                       phone: "3035798738",
                       country_code: "1234",
                       password: "")
     assert user.invalid?
  end

  test "a user cannot be created with a duplicate email" do
    user = User.create(first_name: "Pete",
                      last_name: "Mitchell",
                      email: "maverick@topgun.com",
                      phone: "3035798738",
                      country_code: "1234",
                      password: "valid")
    assert user.invalid?
  end

  test "a user can have a full_name" do
    assert_equal "Pete Mitchell", @valid_user.full_name
  end
end

  # it "is saved with a slug" do
  #   saved_user = User.create(first_name: "Valid",
  #                            last_name: "User",
  #                            display_name: "valid",
  #                            about_me: "valid",
  #                            email: "valid@email.com",
  #                            password: "password")
  #   expect(saved_user.slug).to eq("valid")
  # end
  #
  # it "is not valid with a duplicate slug" do
  #   User.create(first_name: "Different",
  #               last_name: "User",
  #               display_name: "valid",
  #               about_me: "valid",
  #               email: "different@gmail.com",
  #               password: "password")
  #
  #   invalid_user = User.create(first_name: "Valid",
  #                              last_name: "User",
  #                              display_name: "valid",
  #                              about_me: "valid",
  #                              email: "valid@email.com",
  #                              password: "password")
  #   expect(invalid_user).to_not be_valid
  # end
