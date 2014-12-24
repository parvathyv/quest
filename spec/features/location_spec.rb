require 'rails_helper'

feature 'user adds a new restaurant', %Q{
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
    

    restaurant = FactoryGirl.build(:location)

    visit '/locations/new'
  
    fill_in 'Address', with: restaurant.address
    
    click_on 'Create'

    expect(page).to have_content 'Location was successfully created.'
   
  end

  scenario 'without required attributes' do
    visit '/locations/new'
    click_on 'Create'

    expect(page).to_not have_content 'Location was successfully created.'
    #expect(page).to have_content "can't be blank"
  end

end