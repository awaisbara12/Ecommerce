class User::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :find_product
  before_action :find_user

  # GET /orders or /orders.json
  def index
    # @orders = Order.all
    # @orders = @user.orders
    @orders = Order.paginate(:page => params[:page], :per_page => 6)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new({:product_id => @product.id,:quantity=>1,:price=>@product.Price,:user_id=>current_user.id,:email=>current_user.email})
  end

  # GET /orders/1/edit
  def edit
  end

  def order_products
    @order = Order.create(:user_id => current_user.id)
    @order.price = Cart.where(:user_id => current_user.id ).where(:order_id => nil).sum(:total_price)
    @order.save
    @cart = Cart.where(:user_id => current_user.id).where(:order_id => nil).update_all(:order_id => @order.id)
    respond_to do |format|
      format.html { redirect_to root_url()}
    end
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        OrderNotificationMailer.create_order(@order).deliver_now
        # BaseWorkerJob.perform_async(@order.rentstarted,@order.rentended,@order.id)
        # BaseWorkerJob.perform_at(@order.rentstarted,@order.rentended,@order)

        # e = DateTime.parse(@order.rentended)
        # delay_interval1 =DateTime.parse(@order.rentstarted)
        # puts e.strftime("%H:%M")
        # puts d.strftime("%H:%M")
        
        a = @order.rentended - @order.rentstarted
        puts "Hello with Time "
        puts a
        BaseWorkerJob.perform_in(a,@order.id)
        format.html { redirect_to user_order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        OrderNotificationMailer.update_order(@order).deliver_now
        BaseWorkerJob.perform_async(@order.rentstarted,@order.rentended,@order)
        format.html { redirect_to user_order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @category_id=@order.user_id
    OrderNotificationMailer.delete_order(@order).deliver_now
    @order.destroy

    respond_to do |format|
      format.html { redirect_to user_orders_url(:user_id=>@category_id), notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {}).permit(:user_id, :product_id, :address, :price, :quantity,:email,:status, :rentstarted, :rentended, :Totalrent)
    end

    def find_product
      if params[:product_id]
        @product = Product.find(params[:product_id])
      end
    end
    def find_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      end
    end
end
