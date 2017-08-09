class CommentsController < ApplicationController

  def create
  	@product = Product.find(params[:product_id])
  	@comment = @product.comments.new(comment_params)
  	@comment.user = current_user
  	@comment.save
  	redirect_to product_path(@product)
  end

# GET /products/1
# GET /products/1.json
def show
  @comments = @product.comments.order("created_at DESC")
end

  def destroy 
  end

end

private

  def comment_params
  	params.require(:comment).permit(:user_id, :body, :rating)
  end

