require 'rails_helper'

  describe ProductsController, type: :controller do

#noch mehr aus Variante 3 S. 10-13
#index action
    context 'GET #index' do
      it 'renders index page' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
      end
    end

#show action
    context 'GET #show' do
	  it 'renders the show page' do
	  @product = FactoryGirl.create(:product)
	  get :show, params: {id: @product}
	  expect(response).to be_ok
	  expect(response).to render_template('show')
      end
    end

#create action
context 'POST #create' do
	before do
		@user = FactoryGirl.build(:user)
		sign_in @user
	end
	it 'succesfully creates new product' do
		@product = FactoryGirl.create(:product)
		expect(response).to be_successful
	end
    it 'can not create a product' do
    	expect(Product.new(price:nil)).not_to be_valid
    end
end

   #it 'is an invalid product' do
#@product = FactoryGirl.build(:product, name: "")
#zeile fehlt
#end
#end

#update action
context 'PUT #update' do
  before do
  @product = FactoryGirl.create(:product)
  @user = FactoryGirl.build(:admin)
  sign_in @user
  end

  it "successfully updates product and price" do
  @attr = { :name => @product.name, :image_url => @product.image_url, :id => @product.id, :price => "56" }
  put :update, params: { :id => @product.id, :product => @attr }
  @product.reload
  expect(@product.price).to eq 56
  end
end

#delete action
 context 'DELETE #destroy' do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end
    it "should allow admin to delete product" do
      expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
    end
end

end 