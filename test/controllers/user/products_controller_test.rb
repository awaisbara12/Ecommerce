require 'test_helper'

class User::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get user_products_url
    assert_response :success
  end

  test "should get new" do
    get new_user_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post user_products_url, params: { product: {  } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get user_product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch user_product_url(@product), params: { product: {  } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete user_product_url(@product)
    end

    assert_redirected_to user_products_url
  end
end
