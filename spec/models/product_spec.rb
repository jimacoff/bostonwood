# frozen_string_literal: true
require 'rails_helper'

describe 'Product model' do
  feature 'has information stored' do
    let(:product) { create(:product) }
    let(:uploader) { ImageUploader.new(user, :image) }

    scenario 'and should have a name, material and image' do
      expect(Product.find_by(name: product.name).name).to eq(product.name)
      expect(Product.find_by(name: product.name).build_material).to eq(product.build_material)
      expect(Product.find_by(name: product.name).image).to_not eq(nil)
    end
  end
end
