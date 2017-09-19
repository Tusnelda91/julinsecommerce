FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    email 
    encrypted_password 
    first_name 
    last_name 
    admin false
  end

  factory :admin, class: User do
  	email
  	encrypted_password
  	first_name
  	last_name
  	admin true
  end
end