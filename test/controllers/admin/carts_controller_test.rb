require 'test_helper'

class Admin::CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get admin_carts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post admin_carts_url, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get admin_cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch admin_cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      delete admin_cart_url(@cart)
    end

    assert_redirected_to admin_carts_url
  end
end
