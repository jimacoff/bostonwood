# frozen_string_literal: true
class ProductsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.category = @category
    @product.builder = Builder.find(params[:product][:builder])
    if @product.save
      redirect_to root_path
      flash[:notice] = "Product added successfully"
    else
      flash[:notice] = @product.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    if current_admin != nil
      @category = Category.find(params[:category_id])
      @product = @category.products.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])

    @product.update_attributes(product_params)

    if !params[:product][:image].nil?
      @product.image = params[:product][:image]
    end
    if @product.save
      redirect_to category_product_path(@category, @product)
    else
      flash[:notice] = @product.errors.full_messages.join(", ")
      render action: 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :blurb, :description, :build_material, :image)
  end

end
