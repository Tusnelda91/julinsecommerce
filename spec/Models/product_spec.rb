require 'rails_helper'
describe Product do
  context "when the product has comments" do
     before do  
        @product = FactoryGirl.create(:product)
        @product = Product.create!(id: "1", name: "Schwalbennest", description: "lore ipsum", image_url: "schwalbennest.jpg", price: "999.0", more_about:"Schwalbennest")
        
        @user = FactoryGirl.create(:user) 
        @user = User.create!(id: "1", first_name: "Jimmy", last_name: "Dean", email: "jdean@gmail.com", password: "pipapo")
        

        @product.comments.create!(rating: 3, user: @user, body: "Vacation package was ok!")
        @product.comments.create!(rating: 5, user: @user, body: "Like paradise!")
        @product.comments.create!(rating: 1, user: @user, body: "Awful destination!")
      end

    it "returns the average rating of all comments" do
        expect(@product.average_rating).to eq (3)
    end
 
    it "is not valid without product name" do
      expect(Product.new(description: "Nice offer")).not_to be_valid
    end
  end
end
# First version with let:
=begin
require 'rails_helper'
describe Product do
  context 'when the product has comments' do
      let (:product) {Product.create!(name:"Schwalbennest")}
      let (:user) {User.create!(first_name: "Jimmy", last_name:"Dean", email: "jdean@gmail.com", password: "pipapo")}
      
 
    it "returns the average rating of all comments" do
      product.comments.create!(rating: 1, user: user, body: "Awful destination!")
      product.comments.create!(rating: 3, user: user, body: "Vacation package was ok!!")
      product.comments.create!(rating: 5, user: user, body: "Great!")
      expect(product.average_rating).to eq(3)
    end
    it "is not valid without a name" do
      expect(Product.new(description:"Nice Bike")).not_to be_valid
    end
  end
end
=end