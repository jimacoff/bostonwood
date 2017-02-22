# frozen_string_literal: true
require 'rails_helper'

describe 'Admin should be able to login' do
  feature 'with information stored in DB' do
    let(:admin) { create(:admin) }
    
    scenario 'login page should allow email and password' do
      visit '/admins/sign_in'
      expect(page).to have_field('admin_email')
      expect(page).to have_field('admin_password')
      expect(page).to have_button('Log in')
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
