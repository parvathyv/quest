require 'rails_helper'

feature 'user adds a new hunt', %Q{
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

    my_loc = FactoryGirl.create(:location)
    hunt = FactoryGirl.create(:hunt, location: my_loc, user: my_user)
   
    visit new_location_hunt_path(my_loc)
  
    fill_in 'Name', with: hunt.name
    fill_in 'Description', with: hunt.description
    
    click_on 'Create'

    expect(page).to have_content 'Hunt was successfully created.'
   
  end

  scenario 'without required attributes' do
    my_user = FactoryGirl.create(:user)
    my_loc = FactoryGirl.create(:location)
    hunt = FactoryGirl.create_list(:hunt, 1, location: my_loc, user: my_user)
   
    visit new_location_hunt_path(my_loc)
  
    click_on 'Create'

    expect(page).to_not have_content 'Hunt was successfully created.'
    #expect(page).to have_content "can't be blank"
  end

end