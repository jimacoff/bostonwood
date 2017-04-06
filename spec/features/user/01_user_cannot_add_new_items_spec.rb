# frozen_string_literal: true
require 'rails_helper'

describe 'User should NOT be able to' do
  feature 'add new' do
    let!(:category) { create(:category) }
    let!(:builder) { create(:builder) }

    scenario 'categories' do
      visit '/'
      expect(page).to_not have_link('+ new category')

      visit '/categories/new'
      expect(page).to_not have_field('category_name')
      expect(page).to_not have_field('category_blurb')
      expect(page).to_not have_field('category_description')
      expect(page).to_not have_button('Add New Category')
    end

    scenario 'builders' do
      visit '/'
      expect(page).to_not have_link('+ new builder')

      visit '/builders/new'
      expect(page).to_not have_field('builder_name')
      expect(page).to_not have_field('builder_blurb')
      expect(page).to_not have_field('builder_description')
      expect(page).to_not have_field('builder_city')
      expect(page).to_not have_field('builder_state')
      expect(page).to_not have_button('Add New Builder')
    end
    #
    # scenario 'products' do
    #   visit '/categories/new'
    #   expect(page).to_not have_content('LOCATIONS')
    # end
  end
end
