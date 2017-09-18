require 'rails_helper'

describe User do 
  context "testing validations" do
    
    it 'requires email address' do
      expect(User.new(first_name: "Gitta", last_name: "Ernst", email: nil)).not_to be_valid
    end

     it "requires a password" do
      expect(User.new(email:"gitta@gmail.com", password: nil)).not_to be_valid
    end

  end
end