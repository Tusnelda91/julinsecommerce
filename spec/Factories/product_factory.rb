FactoryGirl.define do
  sequence(:id) { |n| "#{n}" }

  factory :product do
    id
    name "anything"
    description "anything"
    image_url "image.jpg"
    more about "text"
    price 120
  end

end