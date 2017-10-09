FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    email 
    encrypted_password "0987654321"
    first_name "UserA"
    last_name "AUser"
    admin false
  end

  factory :admin, class: User do
  	email
  	encrypted_password "thisisadmin"
  	first_name "Admin"
  	last_name "User"
  	admin true
  end
end