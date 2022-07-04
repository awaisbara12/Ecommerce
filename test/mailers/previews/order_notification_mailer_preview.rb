# Preview all emails at http://localhost:3000/rails/mailers/order_notification_mailer
class OrderNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notification_mailer/create_order
  def create_order
    OrderNotificationMailer.create_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_notification_mailer/update_order
  def update_order
    OrderNotificationMailer.update_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_notification_mailer/delete_order
  def delete_order
    OrderNotificationMailer.delete_order
  end

end
