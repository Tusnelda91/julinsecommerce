require 'rails_helper'
describe Product do
  context "when the product has comments" do
     before do  
     @product = Product.create!(name: "Schwalbennest")
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
       @user = User.create!(first_name: "Jimmy", last_name: "Dean", email: "jdean@gmail.com", password: "pipapo")
    
        @product.comments.create!(rating: 3, user: @user, body: "Vacation package was ok!")
        @product.comments.create!(rating: 5, user: @user, body: "Like paradise!")
        @product.comments.create!(rating: 1, user: @user, body: "Awful destination!")
      end
    it "returns the average rating of all comments" do
        expect(@product.average_rating).to eq (3)
    end
 
    it "is not valid without product name" do
      expect(Product.new(description: "nice bike")).not_to be_valid
    end
  end
end