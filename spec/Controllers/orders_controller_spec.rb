require 'rails_helper'

describe OrdersController, type: :controller do
	context 'GET #index' do
		before do
			@user1 = FactoryGirl.create(:admin)
            @user2 = FactoryGirl.create(:user)
        end

        it 'admin alone allowed to view page' do
	      sign_in(@user1)
	      get :index
	      expect(response).to have_http_status(200)
        end

        it 'users who are not admin are not allowed to view' do
	      sign_in(@user2)
	      get :index
	      expect(response).to redirect_to(root_path)
        end
    end
end