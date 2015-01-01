class Quiz < ActiveRecord::Base
  
  belongs_to :hunt
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def next
    hunt.quizzes.where("id > ?", id).order("id ASC").first
  end

  def get_clue
   
	 
	  search_item = self.address.split(', ').first

	  search_item = search_item.split(' ').each { | word | word.capitalize! }.join(' ')
	     
	  if search_item.strip.size > 1 
	        search_item = search_item.split(' ').join('_')
	  end 


	  search_parameter = search_item

	  url = "http://en.wikipedia.org/wiki/#{search_parameter}"
	 
	  doc = Nokogiri::HTML(open(url).read)
	  
	  characters = doc.css("#mw-content-text p") 


	  latitude = doc.css(".latitude").first.to_s
	  longitude= doc.css(".longitude").first.to_s
	  

	  if characters[1].to_s.length > 100
	    paragraph = characters[1].to_s 
	    
	  else
	     paragraph = characters[0].to_s 
	  end   
	 
	  
	  search_parameter = search_parameter.split('_').join(' ')
	  
	  paragraph = paragraph.gsub(search_parameter, '---') 
	  

	  paragraph = paragraph.gsub(search_parameter.split(' ').first,'---')
	  paragraph = paragraph.split('.').first 
	 
	  
	  
  end  

end
