require "test_helper"

class ForumthreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forumthread = forumthreads(:one)
  end

  test "should get index" do
    get forumthreads_url, as: :json
    assert_response :success
  end

  test "should create forumthread" do
    assert_difference("Forumthread.count") do
      post forumthreads_url, params: { forumthread: { body: @forumthread.body, category: @forumthread.category, string: @forumthread.string, title: @forumthread.title, user_id: @forumthread.user_id, userid: @forumthread.userid, username: @forumthread.username } }, as: :json
    end

    assert_response :created
  end

  test "should show forumthread" do
    get forumthread_url(@forumthread), as: :json
    assert_response :success
  end

  test "should update forumthread" do
    patch forumthread_url(@forumthread), params: { forumthread: { body: @forumthread.body, category: @forumthread.category, string: @forumthread.string, title: @forumthread.title, user_id: @forumthread.user_id, userid: @forumthread.userid, username: @forumthread.username } }, as: :json
    assert_response :success
  end

  test "should destroy forumthread" do
    assert_difference("Forumthread.count", -1) do
      delete forumthread_url(@forumthread), as: :json
    end

    assert_response :no_content
  end
end
