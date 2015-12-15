require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { User.create!(name: "JD Crouch", email: "jdcrouch5@gmail.com", password: "helloworld") }

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show
      expect(response).to render_template :show
    end
  end

end
