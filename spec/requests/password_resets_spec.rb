require 'spec_helper'
describe "PasswordResets" do
  it "emails user when requesting password reset"
    user = Factory(:user)
    visit new_user_session_path
    click_link "Forgot your password?"
    fill_in "user_email", :with => user.email
    click_button "commit"
  end
end