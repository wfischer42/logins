require 'rails_helper'

RSpec.feature "VisitorCanCreateNewUsers", type: :feature do
  pending "add some scenarios (or delete) #{__FILE__}"
  context "new user page" do
    subject do
      visit login_path
      click_on "Create New Account"
      page
    end
    it { is_expected.to have_current_path(new_user_path)}
    it { is_expected.to have_css("#new_user")}
  # context "new user form submission"
  #   subject do
  #     visit new_user_path
  #     fill_in
  #   end
  end
end
