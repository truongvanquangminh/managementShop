class CommentsController < ApplicationController
    def create
        @products = Product.find_by(id: params[:product_id])
        @comment = @products.comments.create(comment_params)
        redirect_to product_path(@products)
    end

    private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :product_id)
    end
end
