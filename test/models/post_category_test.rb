require 'test_helper'

class PostCategoryTest < ActiveSupport::TestCase

  test 'the truth' do
    assert true
  end

  test 'should not save post_category without title' do
    post_category = PostCategory.new
    assert_not post_category.save, 'Saved PostCategory WITHOUT title.'
  end

  test 'should not save post_category with title less then 2 chars' do
    post_category = PostCategory.new(title: 'T', description: 'Lorem Ipsum Description')
    assert_not post_category.save, 'Saved PostCategory with title length less than 2 chars.'
  end

  test 'should not save PostCategory with description length out of 10:199 range' do
    post_category = PostCategory.new(title: 'Test Title', description: 'too short')
    assert_not post_category.save, 'Saved PostCategory with description less than 10 chars.'
  end

end
