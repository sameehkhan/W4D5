require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do 
    it 'renders new user page' do 
      get :new 
      expect(response).to render_template(:new)
    end 
  end 
    
  describe "POST #create" do 
    context 'With valid params' do 
      it 'Logs in users' do 
        post :create, params: { user: { username: 'sameeh', password: 'password'} }
        user = User.find_by(username: 'sameeh')
        expect(session[:session_token]).to eq(user.session_token)
      end  
      it 'redirects to users page' do 
        post :create, params: { user: { username: 'sameeh', password: 'password'} }
        user = User.find_by(username: 'sameeh')
        expect(response).to redirect_to(user_url(user))
      end
    end 
  end   
end 