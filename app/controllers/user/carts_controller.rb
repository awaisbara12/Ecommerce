class User::CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :find_user
  # GET /carts or /carts.json
  def index
    @carts = Cart.where(:user_id => current_user.id).where(:order_id => nil)
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    if params[:product_id]
      @product = Product.find(params[:product_id])
    end
    @cart = Cart.new({:product_id => @product.id,:quantity=>1,:total_price=>@product.Price,:user_id=>current_user.id})
  end

  # GET /carts/1/edit
  def edit
    @product = Product.find(@cart.product_id)
  end

  def order_completed
    @orders = Order.where(:user_id => current_user.id, :status => "completed")
  end

  def order_served
    # debugger
    @order = Order.find(params[:id])
    @order.status = "served"
    @order.save
    respond_to do |format|
      format.html { redirect_to order_completed_user_carts_path()}
    end
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)
    @uid=@cart.user_id

    respond_to do |format|
      if @cart.save
        format.html { redirect_to user_carts_path(:user_id=>current_user.id) }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to user_carts_path(:user_id=>current_user.id) }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to user_carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {}).permit(:user_id, :product_id, :category_id, :quantity, :total_price)
    end

    def find_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      end
    end
end
