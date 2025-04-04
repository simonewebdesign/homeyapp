require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without content" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )
    project = Project.create!(name: "Test Project")

    comment = Comment.new(user: user, project: project)
    assert_not comment.save, "Saved the comment without content"
    assert_includes comment.errors.full_messages, "Content can't be blank"
  end

  test "should not save comment without user" do
    project = Project.create!(name: "Test Project")

    comment = Comment.new(content: "Test comment", project: project)
    assert_not comment.save, "Saved the comment without a user"
    assert_includes comment.errors.full_messages, "User must exist"
  end

  test "should not save comment without project" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )

    comment = Comment.new(content: "Test comment", user: user)
    assert_not comment.save, "Saved the comment without a project"
    assert_includes comment.errors.full_messages, "Project must exist"
  end

  test "should save comment with valid attributes" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )
    project = Project.create!(name: "Test Project")

    comment = Comment.new(
      content: "Test comment",
      user: user,
      project: project,
    )
    assert comment.save, "Could not save the comment with valid attributes"
  end

  test "should belong to user" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )
    project = Project.create!(name: "Test Project")

    comment = Comment.create!(
      content: "Test comment",
      user: user,
      project: project,
    )

    assert_equal user, comment.user
  end

  test "should belong to project" do
    user = User.create!(
      display_name: "Test User",
      email_address: "test@example.com",
      password: "password123",
    )
    project = Project.create!(name: "Test Project")

    comment = Comment.create!(
      content: "Test comment",
      user: user,
      project: project,
    )

    assert_equal project, comment.project
  end
end
