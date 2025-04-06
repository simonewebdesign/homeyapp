require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:dave)
    @project = projects(:one)
    @comment = comments(:one)
  end

  test "should get index" do
    get project_comments_url(@project)
    assert_response :success
  end

  test "should get new" do
    get new_project_comment_url(@project)
    assert_response :success
  end

  test "should create comment and redirect to project" do
    assert_difference("Comment.count") do
      post project_comments_url(@project), params: { comment: { content: @comment.content, project_id: @project.id, user_id: @comment.user_id } }
    end

    assert_redirected_to project_url(@project)
  end

  test "should show comment" do
    get project_comment_url(@project, @comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_comment_url(@project, @comment)
    assert_response :success
  end

  test "should update comment" do
    patch project_comment_url(@project, @comment), params: { comment: { content: @comment.content, project_id: @project.id, user_id: @comment.user_id } }
    assert_redirected_to project_comment_url(@project, @comment)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete project_comment_url(@project, @comment)
    end

    assert_redirected_to project_comments_url(@project)
  end
end
