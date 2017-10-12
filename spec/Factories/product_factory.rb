FactoryGirl.define do
  sequence (:product) { |n| "product#{n}" }

  factory :product do
  	#id "1"
  	sequence(:id) { |id| id }
  	name "testname"
    description "testoffer"
    image_url "image.jpg"
    more_about "text"
    price "120"
  end

end