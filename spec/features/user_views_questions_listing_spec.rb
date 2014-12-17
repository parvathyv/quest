require 'rails_helper'

  feature "User visits the questions page" do
  
  # As a user I want to all the questions on one page
  # so I know the list of questions that need answering
  # or look one up so we can learn
  

  # Acceptance Criteria:
  #
  # * I see a title that lets me know I'm on the right page
  # * I see all of the questions listed
 
  	it "sees a title" do
    	visit '/questions'
    	expect(page).to have_content "You will be rescued, have faith !"
  	end

    it "sees all the questions listed on the page" do
  		# Create two events so we can test that they're displayed on the page
  		question1 = Question.create!(title:'Thisandthatisonethatallmywishescometruejhfghjfghjdsfhjdsgfgshfg',
  			description: 'hghfghfghdsgfhgfhdgsfhjdgsfhgdjhfghghdfghjdsgfhjdshfghjsdgfjhgdshjfghdsgfhgsdfjhgf
  			hdsfgfhdshfghjsdgfhjsgfhgdsgfjhdsgfhgdsfhjghjsdgfhjdsgfjhgdsfjhghsdjgfhjdsgfhgdsfhj', category:'hh',user_id: 1)
  		question2 = Question.create!(title: "Whywhywhywhywhwywhhwyhwyhwhhwyhwyhwhhwyyhwsdhfghfghjdsgfhgdsf",
  			description: 'asjhdgahjfsdhjfgjhdgfhjgfhjgshjfhljsdgfhljgfh;gdsfyghsdgfhjsdgfhjgshjfghdsjgfhsdgf
  			hfgsdhjgfhjdsgfhjdsgfhljgsdhjfgjhdsgfhjgdsfhjgdsjhfgjhdsgfhjgsfhjghjdgfjhgdsfhjgsdhjfgjhdsgf
  			fkjhdsjhfghjsdfghjdsfhgdshjfg', category:'mmm',user_id: 1)

  		visit '/questions'

  		# We expect to see question1's title on the page
  		expect(page).to have_content question1.title
  		# We expect to see question2's title on the page
  		expect(page).to have_content question2.title	
	end



  end



