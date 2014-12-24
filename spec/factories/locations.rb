FactoryGirl.define do

   

  factory :location do
    address "San Fransisco, CA"
  end

 factory :hunt do
    name "Foggy Day"
    description "Discover San Fran on a foggy day"
    user
    location
  end 

  
end
