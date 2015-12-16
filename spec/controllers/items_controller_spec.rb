require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers

  describe "POST create" do
    it "increases the number of Items by 1" do
      expect{post :create, item: {name: "Test Name"}}.to change(Item, :count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, item: {name: "Test Name"}
      expect(assigns(:item)).to eq Item.last
    end 
  end

end
