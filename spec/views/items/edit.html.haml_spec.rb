require 'rails_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :recipe => nil,
      :ingredient => nil,
      :user => nil,
      :amount => "9.99",
      :measure => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_recipe_id[name=?]", "item[recipe_id]"

      assert_select "input#item_ingredient_id[name=?]", "item[ingredient_id]"

      assert_select "input#item_user_id[name=?]", "item[user_id]"

      assert_select "input#item_amount[name=?]", "item[amount]"

      assert_select "input#item_measure[name=?]", "item[measure]"
    end
  end
end
