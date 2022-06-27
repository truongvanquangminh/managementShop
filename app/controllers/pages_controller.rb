class PagesController < ApplicationController
  def home
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end
end
