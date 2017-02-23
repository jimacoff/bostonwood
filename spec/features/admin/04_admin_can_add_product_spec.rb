# frozen_string_literal: true
require 'rails_helper'

describe 'Admin should be able to add new product' do
  feature 'from link on bottom of category page' do
    let!(:admin) { create(:admin) }
    let!(:category) { create(:category) }
    let!(:builder) { create(:builder) }

    scenario 'and should click add product link and see new product form' do
      admin_login
      click_link(category.name)
      click_link('add new product')

      expect(page).to have_field('product_name')
      expect(page).to have_field('product_blurb')
      expect(page).to have_field('product_description')
      expect(page).to have_field('product_build_material')
      expect(page).to have_field('product_builder')
      expect(page).to have_field('product_image')
      expect(page).to have_button('Add New Product')
    end

    scenario 'and should require name, image and build material to save' do
      admin_login
      click_link(category.name)
      click_link('add new product')

      click_button('Add New Product')

      expect(page).to have_content('Name can\'t be blank, Build material can\'t be blank, Image can\'t be blank')
    end

    scenario 'and should be able to add new product' do
      admin_login
      click_link(category.name)
      click_link('add new product')

      fill_in 'product_name', with: 'test product'
      fill_in 'product_build_material', with: 'test material'
      attach_file('upload-here', './spec/images/cheery_pup.jpg')
      click_button('Add New Product')

      expect(page).to have_content('Product added successfully')
      click_link(category.name)
      expect(page).to have_content('test product')
    end

    # scenario 'and should NOT be able to add new product if not admin' do
    #   visit '/'
    #   expect(page).to_not have_link('+ new category')
    # end
  end
end
