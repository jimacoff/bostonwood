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

    @product.update_attributes(product_params)
    if !params[:product][:image].nil?
      @product.image = params[:product][:image]
    end
    if @product.save
      redirect_to root_path
    else
      render action: 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :blurb, :description, :build_material, :image)
  end

end
