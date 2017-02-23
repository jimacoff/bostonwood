# frozen_string_literal: true
require 'rails_helper'

describe 'Pricing model' do
  feature 'has information stored' do
    let(:pricing_product) { create(:product) }
    let(:pricing) { create(:pricing, product_id: pricing_product.id) }

    scenario 'and should be associated with a product' do
      expect(pricing.product.name).to eq(pricing_product.name)
    end

    scenario 'and should contain pricing data to be parsed' do
      expect(pricing.data).to_not eq(nil)
    end

    scenario 'and has method to return just widths' do
      expect(pricing.widths).to eq("48 54 60 66 72")
    end

    scenario 'and has method to return just heights' do
      expect(pricing.heights).to eq("24 30 36 42 48")
    end

    scenario 'and has method to return prices based on row #' do
      pricing.heights.split(" ").each_with_index do |n, i|
        expect(pricing.price(i)).to_not eq(nil)
      end
    end
  end
end
