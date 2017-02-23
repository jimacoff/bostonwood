# frozen_string_literal: true
require 'rails_helper'

describe 'Builder model' do
  feature 'has information stored' do
    let(:category) { create(:category) }

    scenario 'and should have a name' do
      expect(Category.find_by(name: category.name).name).to eq(category.name)
    end

    scenario 'and should be linked to products' do
      expect(Category.find_by(name: category.name).products).to eq([])
    end
  end
end
