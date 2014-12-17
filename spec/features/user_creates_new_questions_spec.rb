require 'rails_helper'

  feature "User visits the new questions page" do
  
  # As a user I want to visit a page that will allow
  # me to post a question
  

  # Acceptance Criteria:
  #
  # * I see a title that lets me know I'm on the right page
  # * I see a form with title, description and category form 
  # * fields to be filled
 
  	it "sees a title" do
    	visit '/questions/new'
    	expect(page).to have_content "Your SOS"
  	end

	it "creates a valid question" do
    # Visit the page containing the new question form
    	visit '/questions/new'

    # Fill in the input field with the 'title' label
      fill_in "Title", with: "here we gowhywhywhhywhhwyhwywhhwyhwyhwyhwhhywhwyhwhy"
    	fill_in "Description", with: "here we gowhywhywhhywhhwyhwywhhwyhwyhwhghdsgfhjgdfhgdshfgsdgfgdsfydsfygffydsfyfdfsdffsdhgfghdsfgdsfghdsfgdfsgfdsfgdsghfdgsfghdsfghdsfhgsdfghdsghfdfyhwhhywhwyhwhyhhfghjgfhjdsgfhjgdshfgshdjgfhjdsgfjhsdgfjhgsdjhfgjhsdgfjhsgfjhsdgfjhsdgfjhgsdfjhgsdjfh"
    	fill_in "Category", with: "here we gowhywhywhhywhhwyhwywhhwyhwyhwyhwhhywhwyhwhy"
    	click_on "Create"

    	expect(page).to have_content "Question was successfully created"
  	end


  end



