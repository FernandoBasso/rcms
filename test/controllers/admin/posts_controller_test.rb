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
      # Post needs a category as a FK.
      @post_one.post_category = post_categories(:post_category_one);
      post admin_posts_url, params: { post: @post_one.attributes }
    end

    assert_redirected_to admin_post_url(Post.last)

    # TODO: When post doesn't pass validation, new is rendered
    # again but we need to make sure all @post_categories is available.
  end

  test "should show post" do
    get admin_post_url(id: @post_one.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_url(id: @post_one.id)
    assert_response :success
  end

  test "should update post" do
    patch admin_post_url(id: @post_one.id),
      params: { post: @post_one.attributes }
    assert_redirected_to admin_posts_url

    # TODO: When post doesn't pass validation, edit is rendered
    # again but we need to make sure all @post_categories is available.
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete admin_post_url(id: @post_one.id)
    end

    assert_redirected_to admin_posts_url
  end
end
