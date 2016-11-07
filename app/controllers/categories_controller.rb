class CategoriesController < ApplicationController
  def index
    @builders = Builder.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order('name ASC')
  end
end
