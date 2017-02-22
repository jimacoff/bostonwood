# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

describe 'Admin should be able to login' do
  feature 'Admin has information stored in DB' do
    let(:good_admin) { create(:admin) }

    scenario 'should have an email' do
      expect(good_admin.email).to eq('admin_email@bostonwood.com')
    end
  end
end
