require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get admin_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post admin_orders_url, params: { order: {  } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get admin_order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch admin_order_url(@order), params: { order: {  } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete admin_order_url(@order)
    end

    assert_redirected_to admin_orders_url
  end
end
