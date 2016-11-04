require 'spec_helper'
require 'rails_helper'

describe 'Builder should be added to the database' do

  feature 'Builder model has requirements' do
    let!(:test_builder) { create(:builder) }

    scenario 'should require a name' do
      expect(test_builder.name).to_not eq("")
    end

    scenario 'should fail if no name given' do
      failing_builder = Builder.new
      failing_builder.name = nil
      expect(failing_builder.save).to eq(false)
    end
  end
end
