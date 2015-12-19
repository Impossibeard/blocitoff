require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  include Devise::TestHelpers

  let(:user) { create(:user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns user to @users" do
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: user.id}
      expect(response).to render_template :show
    end
  end

end
