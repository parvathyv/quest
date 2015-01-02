FactoryGirl.define do

   factory :user do
    name "MaRaj"
    sequence(:email) { |n| "#{n}geneparm@privateeyes.com"}
    password "supersecret"
    password_confirmation 'supersecret'
  end 

  factory :location do
    sequence(:address) { |n| "#{n}Seattle, WA"}
  end

 factory :hunt do
    sequence(:name) { |n| "#{n}nnn"}
    description "Discover SanFran on a foggy day"
   
    user
    location
   
   
  end 

  
end
