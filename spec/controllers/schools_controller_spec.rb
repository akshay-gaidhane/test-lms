require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  login_user
  let(:valid_attributes) {
      { :name => "School", :subdomain => "school 1" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      School.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "returns a success response" do
      expect do 
        post :create, params: {school: {name: 'School 2', subdomain: 'School 2' }}
      end.to change(School, :count).by(1)
    end

    it "returns a false response" do
      expect do 
        post :create, params: {school: {name: 'School 2', subdomain: '' }}
      end.to change(School, :count).by(0)
    end
  end

  describe 'GET #show' do
    it 'renders a successful response' do
      school = School.new(valid_attributes)
      school.user_id = 1
      school.save
      get :show, params: {id: school}
      expect(response).to be_successful
    end
  end

  describe 'DELETE #destroy' do
    it 'renders a successful response' do
      school = School.new(valid_attributes)
      school.user_id = 1
      school.save
      expect{     
        delete :destroy, params: {id: school}
      }.to change(School,:count).by(-1)
    end
  end
end