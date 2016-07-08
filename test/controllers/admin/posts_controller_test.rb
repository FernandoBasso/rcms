require 'test_helper'

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_one = posts(:post_one)
    @post_two = posts(:post_two)
  end

  test "should get index" do
    get admin_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      # If we just pass "@post" it is a string because it comes from
      # the fixtures. For some reason, it is not a hash. So, we need to
      # that its attributes so it ‘becomes’ a hash.
      post admin_posts_url, params: { post: @post_one.attributes }
    end

    assert_redirected_to admin_post_url(Post.last)
  end

  test "should show post" do
    get admin_post_url(@post_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_url(@post_one)
    assert_response :success
  end

  test "should update post" do
    patch admin_post_url(@post_one), params: { post: @post_one.attributes }
    assert_redirected_to admin_posts_url
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete admin_post_url(@post_one)
    end

    assert_redirected_to admin_posts_url
  end
end
