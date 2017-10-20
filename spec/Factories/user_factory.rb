FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    email 
    #id "1"
    sequence(:id) { |id| id }
    password "0987654321" #encrypted_password?
    first_name "UserA"
    last_name "AUser"
    admin false
  end


  factory :admin, parent: :user do
    #id
    admin true
  end
end