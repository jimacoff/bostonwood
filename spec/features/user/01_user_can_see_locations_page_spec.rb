# frozen_string_literal: true
require 'rails_helper'

describe 'User should be able to navigate' do
  feature 'to locations page' do

    scenario 'from the sidebar' do
      visit '/'
      expect(page).to have_link('LOCATIONS')
    end

    scenario 'and see the watertown location information' do
      visit '/'
      click_link('LOCATIONS')

      expect(page).to have_content('Watertown Store')
      expect(page).to have_content('55 Mount Auburn Street, Watertown, MA')
      expect(page).to have_content('617-924-7412')
      expect(page).to have_content('watertown@bostonwood.com')
    end

    scenario 'and see the bedford location information' do
      visit '/'
      click_link('LOCATIONS')

      expect(page).to have_content('Bedford Store')
      expect(page).to have_content('331 Great Road, Bedford, MA')
      expect(page).to have_content('781-275-1135')
      expect(page).to have_content('bedford@bostonwood.com')
    end
  end
end
