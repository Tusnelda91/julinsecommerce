FactoryGirl.define do
  sequence(:id) { |n| "#{n}" }

  factory :product do
    id
    name "testname"
    description "testoffer"
    image_url "image.jpg"
    more_about "text"
    price "120"
  end

end