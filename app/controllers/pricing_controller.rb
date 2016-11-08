class PricingController < ApplicationController
  def edit
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
    @pricing_object = @product.pricing_object
  end
end
