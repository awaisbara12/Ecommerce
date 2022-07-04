class OrderNotificationMailer < ApplicationMailer

  
  def create_order(order)
    @order = order

    mail to: @order.email, subject:'Your order for product is booked'
  end

  
  def update_order(order)
    @order = order

    mail to: @order.email, subject:'Your order for product is Updated'
  end

  
  def delete_order(order)
    @order = order

    mail to: @order.email, subject:'Your order for product is deleted'
  end
end
