class BaseWorkerJob
  include Sidekiq::Job
  queue_as :default
  def perform(order_id)
    
    # puts "Sidekiq BaseWorker generating a report from #{startdate} to #{enddate} "
    @order = Order.find(order_id)
    # d=DateTime.now
    # # d.strftime("%d/%m/%Y %H:%M:%S )
    # e= DateTime.parse(enddate)
    # puts e.strftime("%H:%M")
    # puts d.strftime("%H:%M")
    # puts @order.email
    # if e == d.strftime("%H:%M")
      puts "Hello Time is over"
      OrderNotificationMailer.delete_order(@order).deliver_now
      @order.destroy
    # end
    # Do something
  end

  # def perform_at(enddate,order_id)
  #   puts "Sidekiq BaseWorker generating a report from #{enddate} "
  #   @order = Order.find(order_id)
  #   d=DateTime.now
  #   # d.strftime("%d/%m/%Y %H:%M:%S )
  #   e= DateTime.parse(enddate)
  #   puts e.strftime("%H:%M")
  #   puts d.strftime("%H:%M")
  #   puts @order.email
  #   if e == d.strftime("%H:%M")
  #     puts "Hello Time is over"
  #     OrderNotificationMailer.delete_order(@order).deliver_now
  #     @order.destroy
  #   end
  # end
end
