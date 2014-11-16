require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'pantry' do
    before do
      @ingredient = create(:ingredient, name: "onion")
      @user = create(:user)
      @user_item = create(:item, user: @user, ingredient: @ingredient)
      @item = create(:item, ingredient: @ingredient)
      @cucumber = create(:ingredient, name: 'cucumber')
      @item_cucumber =create(:item, ingredient: @cucumber)
    end
    it "returns amount of specified item in the pantry" do
      expect(@user.fetch_pantry_item_amount(@item)).to eq 1
    end

    it "returns 0 if user doesnt have any of specified items" do
      expect(@user.fetch_pantry_item_amount(@item_cucumber)).to eq 0
    end

    it "returns true if user has item in pantry" do
      expect(@user.has_item?(@item)).to eq true
    end

    it "returns false if user doesnt have item in pantry" do
      expect(@user.has_item?(@item_cucumber)).to eq false
    end
  end

end
