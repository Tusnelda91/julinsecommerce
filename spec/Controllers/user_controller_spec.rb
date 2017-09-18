require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(email: 'gitta@example.de', password: 'turtle1234')}

  describe 'GET #show' do

    context 'when a user is logged in' do
        before do  
       	 sign_in user
        end
       	 
       	it 'loads correct user details' do
       		get :show, params: { id: user.id }
       		expect(response).to eq (200)
            expect(assigns(:user)).to eq user
        end
  end

    context 'when a user is not logged in' do
    
        it 'redirects to login' do
          get :show, params: { id: user.id }
          expect(response).to redirect_to (new_user_session_path)
        end
    end

     context 'User cannot see other user page' do
        before do
          sign_in user2
        end
        it "redirects to root path" do
          get :show, params: { id: user2.id }
          expect(response).to redirect_to(root_path)
        end
    end

   end
end


