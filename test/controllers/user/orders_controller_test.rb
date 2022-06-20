require 'test_helper'

class User::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get user_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_user_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post user_orders_url, params: { order: {  } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get user_order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch user_order_url(@order), params: { order: {  } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete user_order_url(@order)
    end

    assert_redirected_to user_orders_url
  end
end
