# frozen_string_literal: true
require 'rails_helper'

describe 'Builder model' do
  feature 'has information stored' do
    let(:builder) { create(:builder) }

    scenario 'and should have a name' do
      expect(Builder.find_by(name: builder.name).name).to eq(builder.name)
    end

    scenario 'and should be linked to products' do
      expect(Builder.find_by(name: builder.name).products).to eq([])
    end
  end
end
