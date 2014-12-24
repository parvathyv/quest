class Quiz < ActiveRecord::Base
  
  belongs_to :hunt
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
