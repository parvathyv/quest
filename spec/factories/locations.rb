FactoryGirl.define do

   factory :user do
    name "MaRaj"
    sequence(:email) { |n| "#{n}geneparm@privateeyes.com"}
    password "supersecret"
  end 

  factory :location do
    sequence(:address) { |n| "#{n}Seattle, WA"}
  end

 factory :hunt do
    sequence(:name) { |n| "#{n}nnn"}
    description "Discover SanFran on a foggy day"
    #association :user, factory: :user
    association :user, factory: :user
    association :location, factory: :location
   
    #association :location, factory: :location
     #after(:create) do |liztng|
      #FactoryGirl.create_list(:hunt, 1, user: liztng.user, hunt:liztng.location)
    #end
  end 

  
end
