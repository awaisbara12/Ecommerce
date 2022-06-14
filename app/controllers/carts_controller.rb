class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :find_category

  # GET /carts or /carts.json
  def index
    # puts params[:user_id]
    # if params[:user_id]
    #   @carts = Cart.where(:user_id => params[:user_id])
    # end
    @carts = @user.carts

  end

  # GET /carts/1 or /carts/1.json
  def show

  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)
    @uid=@cart.user_id
    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart,:user_id=>@uid), notice: "Cart was successfully created." }
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
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @Uid= @cart.user_id
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url(:user_id=>@Uid), notice: "Cart was successfully destroyed." }
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
      params.require(:cart).permit(:user_id, :product_id, :category_id, :quantity, :total_price)
    end

    def find_category
      if params[:user_id]
        puts params[:user_id]
        @user = User.find(params[:user_id])
      end
    end
end
