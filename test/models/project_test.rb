require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "should not save project without a name" do
    project = Project.new
    assert_not project.save, "Saved the project without a name"
    assert_includes project.errors.full_messages, "Name can't be blank"
  end

  test "should not save project with a duplicate name" do
    Project.create(name: "Test Project") # existing project
    project = Project.new(name: "Test Project")
    assert_not project.save, "Saved the project with a duplicate name"
    assert_includes project.errors.full_messages, "Name has already been taken"
  end

  test "should save project with valid attributes" do
    project = Project.new(name: "Valid Project")
    assert project.save, "Could not save the project with valid attributes"
  end

  test "should have a default status of not_started" do
    project = Project.new(name: "New Project")
    assert_equal "not_started", project.status
  end

  test "should only accept valid status values" do
    project = Project.new(name: "Status Test Project")
    assert project.valid?

    project.status = "in_progress"
    assert project.valid?

    project.status = "done"
    assert project.valid?
  end

  test "should not save an invalid status value" do
    project = Project.new(name: "Invalid Status Project")
    assert_raises(ActiveRecord::RecordInvalid) do
      project.status = "invalid_status"
      project.save!
    end
  end
end
