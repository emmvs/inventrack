# app/controllers/warehouses_controller.rb
class WarehousesController < ApplicationController
  before_action :warehouse_check, only: %i[show edit update destroy]

  def index
    @warehouses = Warehouse.all.reverse
  end

  def show; end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to @warehouse
    else
      render :new
    end
  end

  def edit; end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse, notice: 'Your amazing warehouse is edited!'
    else
      render :edit
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to warehouses_path,
                status: :see_other,
                data: { turbo_confirm: 'Are you sure you want to delete this beautiful Warehouse?' }
  end

  private

  def warehouse_check
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :address, :capacity)
  end
end
