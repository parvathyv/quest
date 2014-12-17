require 'rails_helper'

  feature "User signs in to application", %q(
  
  # As a user I want to sign in to a web app
  
  

  # Acceptance Criteria:
  #
  # * I see a title that lets me know I'm on the right page
  # * I see a form with title, description and category form 
  # * fields to be filled
 )  do
  
    scenario "user provides valid info" do
      visit root_path
      click_on "Sign Up"

      fill_in "First Name", with: "Parvathy"
      fill_in "Last Name", with: "Iyer"
      fill_in "Email", with: "paro_v@yahoo.com"
      fill_in "Password", with: "supersecret"
      fill_in "Password confirmation", with: "supersecret"
      click_on "Sign Up"

      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end
 



