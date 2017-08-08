FactoryGirl.define do
  factory :user do
    username RandomData.random_username
    email RandomData.random_email
    password RandomData.random_password
    standard true
    premium false
    admin false
   end
 end
