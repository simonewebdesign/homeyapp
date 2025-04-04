require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without display_name" do
    user = User.new(email_address: "test@example.com", password: "password123")
    assert_not user.save, "Saved the user without a display name"
    assert_includes user.errors.full_messages, "Display name can't be blank"
  end

  test "should not save user without email_address" do
    user = User.new(display_name: "Test User", password: "password123")
    assert_not user.save, "Saved the user without an email address"
    assert_includes user.errors.full_messages, "Email address can't be blank"
  end

  test "should not save user without password" do
    user = User.new(display_name: "Test User", email_address: "test@example.com")
    assert_not user.save, "Saved the user without a password"
    assert_includes user.errors.full_messages, "Password can't be blank"
  end

  test "should not save user with duplicate display_name" do
    User.create!(
      display_name: "Test User",
      email_address: "original@example.com",
      password: "password123",
    )

    user = User.new(
      display_name: "Test User",
      email_address: "different@example.com",
      password: "password123",
    )
    assert_not user.save, "Saved the user with a duplicate display name"
    assert_includes user.errors.full_messages, "Display name has already been taken"
  end

  test "should not save user with duplicate email_address" do
    User.create!(
      display_name: "Original User",
      email_address: "test@example.com",
      password: "password123",
    )

    user = User.new(
      display_name: "Different User",
      email_address: "test@example.com",
      password: "password123",
    )
    assert_not user.save, "Saved the user with a duplicate email address"
    assert_includes user.errors.full_messages, "Email address has already been taken"
  end

  test "should normalize email address" do
    user = User.create!(
      display_name: "Test User",
      email_address: "  TEST@ExaMPLE.com  ",
      password: "password123",
    )
    assert_equal "test@example.com", user.email_address
  end

  test "should authenticate with correct password" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )
    assert user.authenticate("password123"), "Failed to authenticate with correct password"
  end

  test "should not authenticate with incorrect password" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )
    assert_not user.authenticate("wrongpassword"), "Authenticated with incorrect password"
  end

  test "should destroy associated sessions when user is destroyed" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )
    user.sessions.create!

    assert_difference "Session.count", -1 do
      user.destroy
    end
  end
end
