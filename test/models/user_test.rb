require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save the user without an email" do
    user = User.new
    assert_not user.save, "Saved the user without an email"
  end

  test "should save the user with valid email and password" do
    user = User.new(email: "markrodgertest@test.com", password: "password123")
    assert user.save, "Failed to save the user with valid email and password"
  end

  test "should not save the user with duplicate email" do
    # Create a user
    User.create(email: "duplicate_user@test.com", password: "password123")

    # Attempt to create another user with the same email
    user = User.new(email: "duplicate_user@test.com", password: "password123")
    assert_not user.save, "Saved a user with a duplicate email"
  end
end

