# frozen_string_literal: true
require 'rails_helper'

describe 'Admin' do
  feature 'should be able to delete category' do
    let!(:admin) { create(:admin) }
    let!(:category) { create(:category) }

    scenario 'and should see delete category link on category page' do
      admin_login
      click_link(category.name)

      expect(page).to have_link('delete category')
    end

    # scenario 'by clicking link on category page' do
    #   admin_login
    #   click_link(category.name)
    #   click_link('delete category')
    #
    #   expect(page).to have_content('category successfully deleted')
    #   expect(page).to_not have_link(category.name)
    # end
  end
end
