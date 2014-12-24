FactoryGirl.define do

   factory :user do
    name "Parvathy mmm Iyer"
    sequence(:email) { |n| "#{n}geneparm@privateeyes.com"}
    password "supersecret"
  end	

end
