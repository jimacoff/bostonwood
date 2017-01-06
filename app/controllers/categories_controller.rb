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
    @eg_products = []
    @bk_products = []
    @arch_products = []
    @penns_products = []
    working_products = @category.products
    working_products.each_with_index do |product, index|
      if index == 0
        if product.builder.name == "Evergreen"
            @eg_products.push(product)
          elsif product.builder.name == "Berkshire"
            @bk_products.push(product)
          elsif product.builder.name == "Archbold"
            @arch_products.push(product)
          else
            @penns_products.push(product)
        end
      elsif product.name.split(" ")[0].to_i > @eg_products.last.name.split(" ")[0].to_i
        if product.builder.name == "Evergreen"
            @eg_products << product
          elsif product.builder.name == "Berkshire"
            @bk_products << product
          elsif product.builder.name == "Archbold"
            @arch_products << product
          else
            @penns_products << product
        end
      else
        working_products.each_with_index do |check, index|
          if product.name.split(" ")[0].to_i <= check.name.split(" ")[0].to_i
            if product.builder.name == "Evergreen"
                @eg_products.insert(index, product)
              elsif product.builder.name == "Berkshire"
                @bk_products.insert(index, product)
              elsif product.builder.name == "Archbold"
                @arch_products.insert(index, product)
              else
                @penns_products.insert(index, product)
            end
            break
          else
            next
          end
        end
      end
    end
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

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    redirect_to root_path
    flash[:notice] = "Category deleted"
  end

  private

  def category_params
    params.require(:category).permit(:name, :blurb, :description)
  end
end
