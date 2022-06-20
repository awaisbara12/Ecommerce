require 'test_helper'

class User::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get user_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_user_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post user_categories_url, params: { category: {  } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get user_category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch user_category_url(@category), params: { category: {  } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete user_category_url(@category)
    end

    assert_redirected_to user_categories_url
  end
end
