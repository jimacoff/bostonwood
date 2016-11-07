# frozen_string_literal: true
class CategoriesController < ApplicationController
  def index
    @builders = Builder.all
  end

  def new
    if !current_admin.nil?
      @category = Category.new
    else
      redirect_to root_path
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
      flash[:notice] = "Category added successfully"
    else
      flash[:notice] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order('name ASC')
  end

  def edit
    if !current_admin.nil?
      @category = Category.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)

    if @category.save
      redirect_to category_path(@category)
    else
      flash[:notice] = @category.errors.full_messages.join(", ")
      render action: 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :blurb, :description)
  end
end
