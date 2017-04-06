# frozen_string_literal: true
class CategoriesController < ApplicationController
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
    @category = Category.find_by name: (params[:name])
    @products = @category.products.sort_by{ |x| x.order_num.to_i }
  end

  def edit
    if !current_admin.nil?
      @category = Category.find_by name: (params[:name])
    else
      redirect_to root_path
    end
  end

  def update
    @category = Category.find_by name: (params[:name])
    @category.update_attributes(category_params)

    if @category.save
      redirect_to category_path(@category)
    else
      flash[:notice] = @category.errors.full_messages.join(", ")
      render action: 'edit'
    end
  end

  def destroy
    @category = Category.find_by name: (params[:name])
    @category.delete
    redirect_to root_path
    flash[:notice] = "Category deleted"
  end

  private

  def category_params
    params.require(:category).permit(:name, :blurb, :description)
  end
end
