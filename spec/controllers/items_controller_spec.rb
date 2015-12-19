require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers

  let(:user) { create(:user) }

  let(:item) { create(:item) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "POST create" do
    it "increases the number of Items by 1" do
      expect{post :create, format: :js, item: {name: "Test Name", user: user}}.to change(Item, :count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, format: :js, item: {name: "Test Name", user: user}
      expect(assigns(:item)).to eq Item.last
    end
  end

end
