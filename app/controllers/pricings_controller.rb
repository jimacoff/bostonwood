class PricingsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
    @pricing_object = Pricing.new
  end

  def create
    @pricing_object = Pricing.new
    @pricing_object.product_id = params[:pricings][:product_id]
    widths = params[:pricings][:widths].split(" ")
    heights = params[:pricings][:heights].split(" ")
    pricing_data = {}
    heights.length.times do |count|
      array = params[count.to_s].split(" ")
      pricing_data[count.to_s.to_sym] = array
    end
    data = {}
    data[:item_pricing] = {}
    data[:item_pricing][:dimensions] = {}
    data[:item_pricing][:dimensions][:widths] = widths
    data[:item_pricing][:dimensions][:heights] = heights
    data[:item_pricing][:unfinished_pricing] = pricing_data
    @pricing_object.data = data.to_json
    if @pricing_object.save
      redirect_to root_path
      flash[:notice] = "Pricing added successfully"
    else
      flash[:notice] = @pricing_object.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
    @pricing_object = @product.pricing_object
  end

  def update
    @product = Product.find(params[:product_id])
    @category = Category.find(params[:category_id])
    @pricing_object = @product.pricing_object
    height_array_length = params[:pricing][:heights].split(", ").length
    widht_array_length = params[:pricing][:heights].split(", ").length

    @pricing_object.data["item_pricing"]["dimensions"]["widths"] = params[:pricing][:widths].split(", ")
    @pricing_object.data["item_pricing"]["dimensions"]["heights"] = params[:pricing][:heights].split(", ")

    (height_array_length - 1).times do |count|
      @pricing_object.data["item_pricing"]["unfinished_pricing"][(count + 1).to_s] = params[:pricing][(count + 1).to_s].split(", ")
    end

    if @pricing_object.save
      redirect_to category_product_path(@category, @product)
    else
      flash[:notice] = @pricing_object.errors.full_messages.join(", ")
      render action: 'edit'
    end
  end
end
