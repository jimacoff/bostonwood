# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

describe 'Admin model' do
  feature 'has information stored' do
    let(:good_admin) { create(:admin) }

    scenario 'and should have an email' do
      expect(good_admin.email).to eq('admin_email@bostonwood.com')
    end
  end
end
