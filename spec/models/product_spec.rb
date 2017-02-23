# frozen_string_literal: true
require 'rails_helper'

describe 'Product model' do
  feature 'has information stored' do
    let(:product) { create(:product) }

    let(:eg_builder) { create(:builder, name: "Evergreen") }
    let(:eg_product) { create(:product, builder: eg_builder) }
    let(:eg_pricing) { create(:pricing, product: eg_product) }

    let(:bk_builder) { create(:builder, name: "Berkshire") }
    let(:bk_product) { create(:product, builder: bk_builder) }
    let(:bk_pricing) { create(:pricing, product: bk_product) }

    let(:penns_builder) { create(:builder, name: "Penns Creek") }
    let(:penns_product) { create(:product, builder: penns_builder) }
    let(:penns_pricing) { create(:pricing, product: penns_product) }

    let(:arch_builder) { create(:builder, name: "Archbold") }
    let(:arch_product) { create(:product, builder: arch_builder) }
    let(:arch_pricing) { create(:pricing, product: arch_product) }


    scenario 'and should have a name, material and image' do
      expect(Product.find_by(name: product.name).name).to eq(product.name)
      expect(Product.find_by(name: product.name).build_material).to eq(product.build_material)
      expect(Product.find_by(name: product.name).image).to_not eq(nil)
    end

    scenario 'should have 20 colors called through method if builder is Evergreen' do
      expect(eg_product.colors.class).to eq(Array)
      expect(eg_product.colors.length).to eq(20)
    end

    scenario 'should have 25 colors called through method if builder is Berkshire' do
      expect(bk_product.colors.class).to eq(Array)
      expect(bk_product.colors.length).to eq(25)
    end

    scenario 'should have 19 colors called through method if builder is Penns Creek' do
      expect(penns_product.colors.class).to eq(Array)
      expect(penns_product.colors.length).to eq(19)
    end

    scenario 'should have 12 colors called through method if builder is Archbold' do
      expect(arch_product.colors.class).to eq(Array)
      expect(arch_product.colors.length).to eq(12)
    end

    scenario 'should return matching pricing object through method' do
      eg_price_var = eg_pricing
      bk_price_var = bk_pricing
      arch_price_var = arch_pricing
      penns_price_var = penns_pricing

      expect(eg_product.pricing_object.product).to eq(eg_product)
      expect(bk_product.pricing_object.product).to eq(bk_product)
      expect(arch_product.pricing_object.product).to eq(arch_product)
      expect(penns_product.pricing_object.product).to eq(penns_product)
    end

    scenario 'should return pricing objects widths string as array through method' do
      eg_price_var = eg_pricing
      bk_price_var = bk_pricing
      arch_price_var = arch_pricing
      penns_price_var = penns_pricing

      expect(eg_product.widths).to eq(eg_pricing.widths.split(" "))
      expect(bk_product.widths).to eq(bk_pricing.widths.split(" "))
      expect(arch_product.widths).to eq(arch_pricing.widths.split(" "))
      expect(penns_product.widths).to eq(penns_pricing.widths.split(" "))
    end

    scenario 'should return pricing objects heights string as array through method' do
      eg_price_var = eg_pricing
      bk_price_var = bk_pricing
      arch_price_var = arch_pricing
      penns_price_var = penns_pricing

      expect(eg_product.heights).to eq(eg_pricing.heights.split(" "))
      expect(bk_product.heights).to eq(bk_pricing.heights.split(" "))
      expect(arch_product.heights).to eq(arch_pricing.heights.split(" "))
      expect(penns_product.heights).to eq(penns_pricing.heights.split(" "))
    end

    scenario 'should return unfinished prices as hash of arrays through method' do
      eg_price_var = eg_pricing
      bk_price_var = bk_pricing
      arch_price_var = arch_pricing
      penns_price_var = penns_pricing

      expect(eg_product.unfinished_prices.class).to eq(Hash)
      eg_product.unfinished_prices.each_with_index do |x, i|
        expect(eg_product.unfinished_prices[i.to_s].class).to eq(Array)
      end

      expect(bk_product.unfinished_prices.class).to eq(Hash)
      bk_product.unfinished_prices.each_with_index do |x, i|
        expect(bk_product.unfinished_prices[i.to_s].class).to eq(Array)
      end

      expect(arch_product.unfinished_prices.class).to eq(Hash)
      arch_product.unfinished_prices.each_with_index do |x, i|
        expect(arch_product.unfinished_prices[i.to_s].class).to eq(Array)
      end

      expect(penns_product.unfinished_prices.class).to eq(Hash)
      penns_product.unfinished_prices.each_with_index do |x, i|
        expect(penns_product.unfinished_prices[i.to_s].class).to eq(Array)
      end
    end

    scenario 'should return finished prices as hash of arrays through method' do
      eg_price_var = eg_pricing
      bk_price_var = bk_pricing
      arch_price_var = arch_pricing
      penns_price_var = penns_pricing

      expect(eg_product.finished_prices.class).to eq(Hash)
      eg_product.finished_prices.each_with_index do |x, i|
        expect(eg_product.finished_prices[i.to_s].class).to eq(Array)
      end

      expect(bk_product.finished_prices.class).to eq(Hash)
      bk_product.finished_prices.each_with_index do |x, i|
        expect(bk_product.finished_prices[i.to_s].class).to eq(Array)
      end

      expect(arch_product.finished_prices.class).to eq(Hash)
      arch_product.finished_prices.each_with_index do |x, i|
        expect(arch_product.finished_prices[i.to_s].class).to eq(Array)
      end

      expect(penns_product.finished_prices.class).to eq(Hash)
      penns_product.finished_prices.each_with_index do |x, i|
        expect(penns_product.finished_prices[i.to_s].class).to eq(Array)
      end
    end

    scenario 'should return finished prices that are 1.5x the unfinished prices' do
      eg_price_var = eg_pricing
      bk_price_var = bk_pricing
      arch_price_var = arch_pricing
      penns_price_var = penns_pricing

      eg_product.unfinished_prices.each_with_index do |x, i|
        expect(eg_product.finished_prices[i.to_s][0].to_i).to eq((eg_product.unfinished_prices[i.to_s][0].to_i * 1.5).floor)
      end

      bk_product.unfinished_prices.each_with_index do |x, i|
        expect(bk_product.finished_prices[i.to_s][0].to_i).to eq((bk_product.unfinished_prices[i.to_s][0].to_i * 1.5).floor)
      end

      arch_product.unfinished_prices.each_with_index do |x, i|
        expect(arch_product.finished_prices[i.to_s][0].to_i).to eq((arch_product.unfinished_prices[i.to_s][0].to_i * 1.5).floor)
      end

      penns_product.unfinished_prices.each_with_index do |x, i|
        expect(penns_product.finished_prices[i.to_s][0].to_i).to eq((penns_product.unfinished_prices[i.to_s][0].to_i * 1.5).floor)
      end
    end

  end
end
