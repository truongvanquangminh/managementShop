class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    # @order.save
    session[:order_id] = @order.id

    respond_to do |format|
      if @order.save
        
        format.html { redirect_to order_items_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      else
        format.html { redirect_to root_url }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
