require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers

  let(:user) { create(:user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "POST create" do
    it "increases the number of Items by 1" do
      expect{post :create, format: :js, user_id: user.id, item: {name: "Test Name", user: user}}.to change(Item, :count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, format: :js, user_id: user.id, item: {name: "Test Name", user: user}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to user page" do
      post :create, format: :js, user_id: user.id, item: {name: "Test Name", user: user}
      expect(response).to redirect_to [user]
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      item = Item.create!(name: Faker::Lorem.word, user: user)

      delete :destroy, format: :js, user_id: user.id, id: item.id
      count = Item.where({id: item.id}).size
      expect(count).to eq 0
    end
    it "returns http success" do
      item = Item.create!(name: Faker::Lorem.word, user: user)

      delete :destroy, format: :js, user_id: user.id, id: item.id
      expect(response).to have_http_status (:success)
    end
  end

end
