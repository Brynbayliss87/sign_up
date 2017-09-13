require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Bryn", email: "email@example.com", password_digest: "password", address: "21 Fake Street", telephone: "0123456789")
  end
  test "should be valid?" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
 end
