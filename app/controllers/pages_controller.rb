class PagesController < ApplicationController
  def home
    @products = Product.search(params[:term])
  end
end
