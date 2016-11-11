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
    @pricing_object = Pricing.find(params[:id])
    @product = @pricing_object.product
  end

  def update
    @pricing_object = Pricing.find(params[:id])
    height_array_length = params[:pricing][:heights].split(" ").length
    width_array_length = params[:pricing][:heights].split(" ").length
    object_data = JSON.parse(@pricing_object.data)

    object_data["item_pricing"]["dimensions"]["widths"] = params[:pricing][:widths].split(" ")
    object_data["item_pricing"]["dimensions"]["heights"] = params[:pricing][:heights].split(" ")

    height_array_length.times do |count|
      object_data["item_pricing"]["unfinished_pricing"][(count).to_s] = params[:pricing][(count).to_s].split(" ")
    end

    @pricing_object.data = object_data.to_json

    if @pricing_object.save
      redirect_to root_path
      flash[:notice] = "pricing updated!"
    else
      flash[:notice] = @pricing_object.errors.full_messages.join(", ")
      render action: 'edit'
    end
  end
end
