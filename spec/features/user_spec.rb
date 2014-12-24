require 'rails_helper'

feature 'user adds a new user', %Q{
  As a site visitor
  I want to add one of my favorite restaurants
  So that I can encourage others to binge eat there
} do

  # Acceptance Criteria:
  # * I must provide the restaurant's name
  # * I must provide the restaurant's address
  # * I must provide the restaurant's city
  # * I must provide the restaurant's state
  # * I must provide the restaurant's zip
  # * I can optionally provide a description and a category
 

  scenario 'user adds a new restaurant' do
    
    my_user = FactoryGirl.build(:user)

   
   
    visit new_user_registration_path
  
    fill_in 'Name', with: my_user.name
    fill_in 'Email', with: my_user.email
    fill_in 'Password', with: my_user.password
    fill_in 'Password confirmation', with: my_user.password
    click_on 'Sign Up'

    expect(page).to have_content 'Welcome! You have signed up successfully'
   
  end

  
end