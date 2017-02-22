# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

describe 'Admin should be able to add new builder' do
  feature 'from link on side bar' do
    let(:admin) { create(:admin) }

    scenario 'and should click add builder link and see new builder form' do
      admin_login
      click_link('+ new builder')

      expect(page).to have_field('builder_name')
      expect(page).to have_field('builder_blurb')
      expect(page).to have_field('builder_description')
      expect(page).to have_field('builder_city')
      expect(page).to have_field('builder_state')
      expect(page).to have_button('Add New Builder')
    end

    scenario 'and should require name to save, rest are optional' do
      admin_login
      click_link('+ new builder')

      fill_in 'builder_description', with: 'this is a test'
      click_button('Add New Builder')

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'and should be able to add new builder' do
      admin_login
      click_link('+ new builder')

      fill_in 'builder_name', with: 'test builder'
      click_button('Add New Builder')

      expect(page).to have_content('Builder added successfully')
      expect(Builder.find_by(name: 'test builder').name).to eq('test builder')
    end
  end
end
