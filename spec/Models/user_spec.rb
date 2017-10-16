require 'rails_helper'

describe User, type: :model do 

  it "should not validate users without an email address" do
  	@user = FactoryGirl.build(:user, email: "not_an_email", password: "secret")
  	expect(@user).to_not be_valid
  end

  it "empty password is not valid" do
    @user = FactoryGirl.build(:user, email: "gitta@gmail.com")
    expect(User.new(email:"gitta@gmail.com", password: nil)).not_to be_valid
  end
  	
  #context "testing validations" do
    
    #it 'requires email address' do
      #expect(User.new(first_name: "Gitta", last_name: "Ernst", email: nil)).not_to be_valid
    #end

     #it "requires a password" do
      #expect(User.new(email:"gitta@gmail.com", password: nil)).not_to be_valid
    #end

  
end