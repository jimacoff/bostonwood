class CategoriesController < ApplicationController
  def index
    @builders = Builder.all
    @categories = Category.all
  end
end
