# frozen_string_literal: true
class ProductsController < ApplicationController
  def new
    if !current_admin.nil?
      @category = Category.find_by name: (params[:category_name])
      @product = Product.new
    else
      redirect_to category_path(@category)
    end
  end

  def create
    @category = Category.find(params[:category_name])
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
    if !current_admin.nil?
      @category = Category.find_by name: (params[:category_name])
      @product = @category.products.find(params[:id])
    else
      redirect_to category_path(@category)
    end
  end

  def show
    @category = Category.find_by name: (params[:category_name])
    @product = @category.products.find(params[:id])
    @pricing_object = @product.pricing_object
    builder = @product.builder.name
    @colors = @product.colors
    gon.widths = @product.widths
    gon.heights = @product.heights
    gon.productId = @product.id
    gon.product = @product
    gon.builder = @product.builder
    gon.unf_prices = @product.unfinished_prices
    gon.fin_prices = @product.finished_prices
    gon.category = @category
  end

  def update
    @category = Category.find(params[:category_name])
    @product = @category.products.find(params[:id])

    @product.update_attributes(product_params)

    if !params[:product][:image].nil?
      @product.image = params[:product][:image]
    end
    if @product.save
      redirect_to category_product_path(@category.name, @product)
    else
      flash[:notice] = @product.errors.full_messages.join(", ")
      render action: 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if !@product.pricing_object.nil?
     @product.pricing_object.delete
   end
    @product.delete
    redirect_to root_path
    flash[:notice] = 'Product successfully deleted'
  end

  private

  def product_params
    params.require(:product).permit(:name, :blurb, :description, :build_material, :image, :order_num)
  end

end
