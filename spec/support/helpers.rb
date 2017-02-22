module Helpers
  def admin_login
    visit '/admins/sign_in'
    fill_in 'admin_email', with: admin.email
    fill_in 'admin_password', with: admin.password
    click_button('Log in')
  end

  def admin_logout
    visit '/'
    click_link('sign out of admin')
  end
end
