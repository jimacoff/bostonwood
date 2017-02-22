# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

describe 'Admin should be able to add new builder' do
  feature 'from link on side bar' do
    let(:admin) { create(:admin) }

    scenario 'should click add builder link and see new builder form' do
      admin_login
      click_link('+ new builder')

      expect(page).to have_field
    end

    scenario 'and should be able to login through admin page' do
      admin_login
      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'and only once logged in should see add builder link in sidebar' do
      visit '/'
      expect(page).to_not have_link('+ new builder')

      admin_login

      expect(page).to have_content('+ new builder')
    end

    scenario 'and only once logged in should see add category link in sidebar' do
      visit '/'
      expect(page).to_not have_link('+ new builder')

      admin_login

      expect(page).to have_content('+ new builder')
    end

    scenario 'and only once logged in should see sign out link in sidebar' do
      visit '/'
      expect(page).to_not have_link('sign out of admin')

      admin_login

      expect(page).to have_content('sign out of admin')
    end

    scenario 'and can log out of admin account' do
      admin_login
      admin_logout
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
