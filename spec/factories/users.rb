FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "#{n}" + RandomData.random_username }
    sequence(:email) { |n| "#{n}" + RandomData.random_email }
    password RandomData.random_password
    standard true
    premium false
    admin false
   end
 end
