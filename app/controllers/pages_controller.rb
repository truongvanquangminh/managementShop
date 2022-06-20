class PagesController < ApplicationController
  def home
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @order_item = current_order.order_items.new
  end

  def productDetail
    @product = Product.find(params[:id])
    if @product.nil?
      redirect_to action: :index
    end
  end
end
