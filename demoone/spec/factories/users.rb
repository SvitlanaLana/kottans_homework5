FactoryGirl.define do
  factory :user do
    sequence(:full_name) { |i| "John Snow #{i}" }
    sequence(:login) { |i| "got#{i}@gmail.com" }
    password    "123321123"
  end 
end