require 'rails_helper'

RSpec.feature "User logs in", type: :feature, js: true do 
  # SETUP
  before :each do
    @user = User.create!(
      first_name:  'Paola',
      last_name:  'Garcia',
      email: 'paola@gmail.com',
      password: "this_is_a_pw_that_has_more_than_16_chars", 
      password_confirmation: "this_is_a_pw_that_has_more_than_16_chars" 
    )
  end

  scenario "User is able to log in the the correct credentials" do
    visit login_path
    within("form") do
      fill_in 'email', with: 'paola@gmail.com'
      fill_in 'password', with: "this_is_a_pw_that_has_more_than_16_chars"
    end 
    click_on 'Submit'
     
    expect(page).to have_content('Log out')   
  end
end
