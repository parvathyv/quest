class Quiz < ActiveRecord::Base
  
  belongs_to :hunt
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def next
    hunt.quizzes.where("id > ?", id).order("id ASC").first
  end

end
