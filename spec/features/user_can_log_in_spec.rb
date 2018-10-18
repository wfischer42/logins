require 'rails_helper'

RSpec.feature "UserCanLogIns", type: :feature do
  describe 'user visits login page' do
    before(:each) { visit login_path }
    it 'shows login form' do
      expect(page).to have_css("#login_form")
    end
    it 'logs in with valid credentials' do
      user = User.create(full_name: "Some Dude",
                  email_address: "abc@abc.com",
                  password: "asdf")
      fill_in "user_email_address", with: "abc@abc.com"
      fill_in "user_password", with: "asdf"
      click_on "Sign In"
      expect(page.driver.request.session[:user]).to eq(user.session_attributes)
    end
    it 'doesnt log in with invalid password' do
      user = User.create(full_name: "Some Dude",
                  email_address: "abc@abc.com",
                  password: "asdf")
      fill_in "user_email_address", with: "abc@abc.com"
      fill_in "user_password", with: "abcd"
      click_on "Sign In"
      expect(page.driver.request.session[:user]).to be_nil
    end
    context 'login successful' do
      it 'routes to user show page after successful log in' do
        user = User.create(full_name: "Some Dude",
                    email_address: "abc@abc.com",
                    password: "asdf")
        fill_in "user_email_address", with: "abc@abc.com"
        fill_in "user_password", with: "asdf"
        click_on "Sign In"
        expect(page.driver.request.session[:user]).to eq(user.session_attributes)
      end
    end
  end
end
