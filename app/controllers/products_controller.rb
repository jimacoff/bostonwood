class ProductsController < ApplicationController
  def edit
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def show
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    @product.image = params[:product][:image]
    @product.save
  end
end
