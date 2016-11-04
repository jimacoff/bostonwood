class CategoriesController < ApplicationController
  def index
    @builders = Builder.all
  end
end
