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

    
  end
end
