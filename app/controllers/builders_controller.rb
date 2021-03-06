# frozen_string_literal: true
class BuildersController < ApplicationController
  def new
    @builder = Builder.new
  end

  def create
    @builder = Builder.new(builder_params)
    if @builder.save
      redirect_to root_path
      flash[:notice] = "Builder added successfully"
    else
      flash[:notice] = @builder.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def builder_params
    params.require(:builder).permit(:name, :blurb, :description, :city, :state)
  end
end
