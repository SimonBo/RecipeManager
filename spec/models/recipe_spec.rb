require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  before do
    food = %w[egg  tomato olive_oil chicken potato cucumber strawberry milk sugar]
    recipe_names = %w[omelette chicken_shit smoothy]
    @user = create(:user)

    @recipe = create(:recipe, name: recipe_names[0])
    ing1 = create(:ingredient, name: food[0])
    ing2 = create(:ingredient, name: food[1])
    ing3 = create(:ingredient, name: food[2])

    @user.items << create(:item, ingredient: ing1, amount: 3, measure: 'piece')
    @user.items << create(:item, ingredient: ing2, amount: 1, measure: 'piece')
    @user.items << create(:item, ingredient: ing3, amount: 5, measure: 'ml')

    @recipe.items << create(:item, ingredient: ing1, amount: 3, measure: 'piece')
    @recipe.items << create(:item, ingredient: ing2, amount: 1, measure: 'piece')
    @recipe.items << create(:item, ingredient: ing3, amount: 5, measure: 'ml')

    @recipe1 = create(:recipe, name: recipe_names[1])
    ing1 = create(:ingredient, name: food[3])
    ing2 = create(:ingredient, name: food[4])
    ing3 = create(:ingredient, name: food[5])

    @recipe1.items << create(:item, ingredient: ing1, amount: 200, measure: 'gr')
    @recipe1.items << create(:item, ingredient: ing2, amount: 2, measure: 'piece')
    @recipe1.items << create(:item, ingredient: ing3, amount: 1, measure: 'piece')

    @recipe2 = create(:recipe, name: recipe_names[2])
    ing1 = create(:ingredient, name: food[6])
    ing2 = create(:ingredient, name: food[7])
    ing3 = create(:ingredient, name: food[8])

    @recipe2.items << create(:item, ingredient: ing1, amount: 200, measure: 'gr')
    @recipe2.items << create(:item, ingredient: ing2, amount: 200, measure: 'ml')
    @recipe2.items << create(:item, ingredient: ing3, amount: 10, measure: 'gr')
  end
  
  it "returns true if recipe can be used with user's pantry" do
    expect(@recipe.compare_ingredients(@user)).to eq true
  end

  it "returns false if recipe cant be used with user's pantry" do
    expect(@recipe1.compare_ingredients(@user)).to eq false
  end
  it "returns recipes that can be used with the current user's pantry" do
    recomendations = Recipe.find_recommendations(@user)

    expect(recomendations).to eq [@recipe]
  end
end
