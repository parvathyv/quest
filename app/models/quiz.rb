class Quiz < ActiveRecord::Base
  
  belongs_to :hunt
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def next
    hunt.quizzes.where("id > ?", id).order("id ASC").first
  end

  def get_clue
    
	  paragraphs = [] 
	  search_item = self.address.split(', ').first

	  search_item = search_item.split(' ').each { | word | word.capitalize! }.join(' ')
	     
	  if search_item.strip.size > 1 
	    search_item = search_item.split(' ').join('_')
	  end 


	  search_parameter = search_item

	  url = "http://en.wikipedia.org/wiki/#{search_parameter}"
	 
	  doc = Nokogiri::HTML(open(url).read)
	  
	  characters = doc.css("#mw-content-text p") 
	  
    
	  if characters[1].to_s.length > 100
	    paragraphs << characters[1].to_s
	    paragraphs << characters[2].to_s 
	    paragraphs << characters[3].to_s  
      
	  else
	    paragraphs << characters[0].to_s
	    paragraphs << characters[1].to_s 
	    paragraphs << characters[2].to_s
	    
	  end   
	 
	  
	  search_parameter = search_parameter.split('_').join(' ')
	  
	  paragraphs = paragraphs.map do|paragraph|
	  	paragraph = paragraph.gsub(search_parameter, '---')

	  end	 
	  
    paragraphs = paragraphs.map do|paragraph|
	  	paragraph = paragraph.gsub(search_parameter.split(' ').first,'---')
	  end
	  paragraphs = paragraphs.map do|paragraph|
	  	paragraph = paragraph.split('.').first 
	  end	
	  paragraphs
	 
	  
  end  

end
