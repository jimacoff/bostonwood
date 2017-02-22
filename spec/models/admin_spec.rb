# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

describe 'Admin model' do
  feature 'has information stored' do
    let(:admin) { create(:admin) }

    scenario 'and should have an email' do
      expect(Admin.find_by(email: admin.email).email).to eq(admin.email)
    end
  end
end
