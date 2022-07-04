require 'test_helper'

class OrderNotificationMailerTest < ActionMailer::TestCase
  test "create_order" do
    mail = OrderNotificationMailer.create_order
    assert_equal "Create order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "update_order" do
    mail = OrderNotificationMailer.update_order
    assert_equal "Update order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "delete_order" do
    mail = OrderNotificationMailer.delete_order
    assert_equal "Delete order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
