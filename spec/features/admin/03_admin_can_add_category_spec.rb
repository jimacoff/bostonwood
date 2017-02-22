# frozen_string_literal: true
require 'rails_helper'

describe 'Admin should be able to add new category' do
  feature 'from link on side bar' do
    let(:admin) { create(:admin) }

    scenario 'and should click add category link and see new category form' do
      admin_login
      click_link('+ new category')

      expect(page).to have_field('category_name')
      expect(page).to have_field('category_blurb')
      expect(page).to have_field('category_description')
      expect(page).to have_button('Add New Category')
    end

    scenario 'and should require name to save, rest are optional' do
      admin_login
      click_link('+ new category')

      fill_in 'category_description', with: 'this is a test'
      click_button('Add New Category')

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'and should be able to add new builder' do
      admin_login
      click_link('+ new category')

      fill_in 'category_name', with: 'test category'
      click_button('Add New Category')

      expect(page).to have_content('Category added successfully')
      expect(page).to have_link('test category')
    end
  end
end
