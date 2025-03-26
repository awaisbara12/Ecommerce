class Chef::DashboardsController < ApplicationController
  before_action :set_order, only: %i[ show update_order ]
  def index
    # debugger
    @orders = Order.where(:status => "pending")
  end

  def show
    @carts = @order.carts
  end

  def update_order
    @order.status = "completed"
    @order.save
    respond_to do |format|
      format.html { redirect_to chef_dashboards_path()}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
end
