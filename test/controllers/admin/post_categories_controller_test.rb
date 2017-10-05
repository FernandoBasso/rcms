require 'test_helper'

class Admin::PostCategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @post_category_one = post_categories(:post_category_one)
    @post_category_two = post_categories(:post_category_two)
  end

  test "should get index" do
    get admin_post_categories_path
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_category_path
    assert_response :success
  end

  test "should create post_category" do
    assert_difference('PostCategory.count') do
      post admin_post_categories_url, params: { post_category: @post_category_one.attributes }
    end

    assert_redirected_to admin_post_category_url(PostCategory.last)
  end

  test "should show post_category" do
    post_category = post_categories(:post_category_one)
    get admin_post_category_url(id: post_category.id)
    assert_response :success
  end

  test "should edit post_category" do
    get edit_admin_post_category_url(id: @post_category_two.id)
    assert_response :success
  end

  test "should update post_category" do
    patch admin_post_category_url(id: @post_category_one.id),
        params: { post_category: @post_category_two.attributes }

    assert_redirected_to admin_post_category_url(@post_category_one)
  end

  test "should destroy post_category" do
    assert_difference('PostCategory.count', -1) do
        delete admin_post_category_url(id: @post_category_one.id)
    end

    assert_redirected_to admin_post_categories_path
  end
end

