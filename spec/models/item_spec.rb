require 'rails_helper'

RSpec.describe Item, :type => :model do
  it "creates a new Ingredient and attaches it to item if item was created with a name and there is no Ingredient with that name" do
    new_item = create(:item, name: 'onion')
    expect(new_item.ingredient_id).not_to be_nil
  end

  it "finds an ingredient based on item name when a new item is created and puts that ingredient_id in item" do
    onion = create(:ingredient, name: 'onion')
    new_item = create(:item, name: 'onion')
    expect(new_item.ingredient_id).to eq onion.id
  end

  it "deletes related user's recommendations if an item is removed from pantry by the user" do
    user = create(:user)
    item = create(:item, name: 'onion')
    user.items << item
    recipe = create(:recipe)
    recipe.items << create(:item, name: 'onion')
    recommendation = create(:recommendation, user: user, recipe: recipe)
    expect(user.recommendations.count).to eq 1
    expect{
      item.destroy
      user.reload
    }.to change(user.recommendations, :count).from(1).to(0)
  end
end
