class Host::DashboardsController < ApplicationController
  def index
    @tables = Table.all.order(status: :desc)
  end

  def update_status
    @table = Table.find(params[:id])
    @table.status = params[:status]
    @table.save
    respond_to do |format|
      format.html { redirect_to host_dashboards_path()}
    end
  end
end
