class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
       flash[:notice] = "Review has been saved!"
       redirect_to product_path(@product)
    else
     render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:content)
  end

end
