require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Bryn", email: "email@example.com", password_digest: "password", password_confirmation: "password",  address: "21 Fake Street", telephone: "0123456789")
  end
  test "should be valid?" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "password should be valid" do
    @user.password_digest = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "password should not be too long" do
    @user.password_digest = "a" * 51
    assert_not @user.valid?
  end

  test "password should be a minimum length" do
    @user.password_digest = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should reject invalid email addresses" do
    invalid_addresses = %w[invalid@email,com invalidatemail.com invalid@email@example.com invalid @email.]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "MiXedEmaiL@ExaMpLe.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
