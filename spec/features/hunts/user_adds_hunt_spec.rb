require 'rails_helper'

feature 'user adds a new hunt', %Q{
  As a site visitor
  I want to add a hunt
  So that I can begin the process of building my hunt for itenirary
} do

  # Acceptance Criteria:
  # * I must provide the hunt's name


  before :each do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
  end

  let!(:hunt) { FactoryGirl.create(:hunt) }

  scenario 'user adds a new hunt' do

    visit new_location_hunt_path(hunt.location)

    fill_in 'Name', with: hunt.name
    fill_in 'Description', with: hunt.description

    click_on 'Create'

    expect(page).to have_content 'Hunt was successfully created.'

  end

end