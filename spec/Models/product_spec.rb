require 'rails_helper'

describe Product do

  context "when the product has comments" do
    let(:product) { Product.create!(name: "Schwalbennest") }

    let(:user) { User.create!(email: "ju_lin@gmx.net") }
    let(:user) { User.create!(password: "Pipapo") }


      before do  
        product.comments.create!(rating: 3, user: user, body: "Vacation package was ok!")
        product.comments.create!(rating: 5, user: user, body: "Like paradise!")
        product.comments.create!(rating: 1, user: user, body: "Awful destination!")
      end

    it "returns the average rating of all comments" do
    	expect(product.average_rating).to eq "3"
    end
  
  end

end