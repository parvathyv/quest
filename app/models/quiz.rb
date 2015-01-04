
class Quiz < ActiveRecord::Base

  belongs_to :hunt

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def next
    hunt.quizzes.where("id > ?", id).order("id ASC").first
  end

  def get_distance(address)

      lat = address.split(',').first.to_f
      lng = address.split(',')[1].to_f
      dist = Geocoder::Calculations.distance_between([lat, lng], [self.latitude,self.longitude])

  end

  def is_answer?(address)
    flag = 0
    if address.split(',').first.to_f != 0
      dist = self.get_distance(address)

      if dist < 0.5
        flag = 1
      else
        @nonmatch = 'dist'
      end
    else
      if address == self.address
        flag = 1
      else
        @nonmatch = 'address'
      end
    end

    flag
  end

  def get_nonmatch
    @nonmatch
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

    #rescue => e
    #  case e
    #   when OpenURI::HTTPError
    #    return
    #   else
    #     raise e
    #  end


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
