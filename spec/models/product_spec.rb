# frozen_string_literal: true
require 'rails_helper'

describe 'Product model' do
  feature 'has information stored' do
    let(:product) { create(:product) }
    let(:eg_builder) { create(:builder, name: "Evergreen") }
    let(:eg_product) { create(:product, builder: eg_builder) }
    let(:bk_builder) { create(:builder, name: "Berkshire") }
    let(:bk_product) { create(:product, builder: bk_builder) }
    let(:penns_builder) { create(:builder, name: "Penns Creek") }
    let(:penns_product) { create(:product, builder: penns_builder) }
    let(:arch_builder) { create(:builder, name: "Archbold") }
    let(:arch_product) { create(:product, builder: arch_builder) }

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
  end
end
