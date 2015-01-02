require 'rails_helper'

feature 'user adds a new location', %Q{
  As a site visitor
  I want to add a location
  or 
  I want to choose a location from a dropdownlist
  So that I can begin the process of building my hunt for itenirary
} do

  # Acceptance Criteria:
  # * I must provide the location's name
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location) }

  scenario 'user adds a new location' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit new_location_path(location)
    
    fill_in 'Address', with: location.address
    
    click_on 'Create'
    save_and_open_page
    expect(page).to have_content 'Location was successfully created.'
   
  end

  scenario 'without required attributes' do
    visit new_location_path(location)
    click_on 'Create'

    expect(page).to_not have_content 'Location was successfully created.'
    expect(page).to have_content "Address can't be blank"
  end

end