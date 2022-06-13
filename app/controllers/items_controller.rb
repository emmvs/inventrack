# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  before_action :item_check, only: %i[show edit update destroy]

  def show; end

  def new
    @item = Item.new
    @warehouse = Warehouse.find(params[:warehouse_id])
  end

  def create
    @item = Item.new(item_params)
    @warehouse = Warehouse.find(params[:warehouse_id])
    @item.warehouse = @warehouse
    if @item.save
      redirect_to warehouse_path(@warehouse)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to warehouse_path(@item.warehouse), notice: 'Your amazing Item is edited!'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path,
                status: :see_other,
                data: { turbo_confirm: 'Are you sure you want to delete this beautiful Item?' }
  end

  private

  def item_check
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :type_of_item)
  end
end
