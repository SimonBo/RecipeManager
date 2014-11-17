require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  before do
    food = %w[egg  tomato olive_oil chicken potato cucumber strawberry milk sugar]
    recipe_names = %w[omelette chicken_shit smoothy]
    @user = create(:user)

    @recipe = create(:recipe, name: recipe_names[0])

    @user.items << create(:item, name: 'egg', amount: 3, measure: 'piece')
    @user.items << create(:item, name: 'tomato', amount: 1, measure: 'piece')
    @user.items << create(:item, name: 'olive_oil', amount: 5, measure: 'ml')

    @recipe.items << create(:item, name: 'egg', amount: 3, measure: 'piece')
    @recipe.items << create(:item, name: 'tomato', amount: 1, measure: 'piece')
    @recipe.items << create(:item, name: 'olive_oil', amount: 5, measure: 'ml')

    @recipe1 = create(:recipe, name: recipe_names[1])

    @recipe1.items << create(:item, name: 'chicken', amount: 200, measure: 'gr')
    @recipe1.items << create(:item, name: 'potato', amount: 2, measure: 'piece')
    @recipe1.items << create(:item, name: 'cucumber', amount: 1, measure: 'piece')

    @recipe2 = create(:recipe, name: recipe_names[2])

    @recipe2.items << create(:item, name: 'strawberry', amount: 200, measure: 'gr')
    @recipe2.items << create(:item, name: 'milk', amount: 200, measure: 'ml')
    @recipe2.items << create(:item, name: 'sugar', amount: 10, measure: 'gr')
    end

    it "returns true if recipe can be used with user's pantry" do
        expect(@recipe.compare_ingredients(@user)).to eq true
    end

    it "returns false if recipe cant be used with user's pantry" do
        expect(@recipe1.compare_ingredients(@user)).to eq false
    end
    it "returns recipes that can be used with the current user's pantry" do
        recommendations = Recipe.find_recommendations(@user)

        expect(recommendations).to eq [@recipe]
        expect(@user.recommendations.count).to eq 1
    end

    it "deletes user's recommendations when a related recipe is deleted " do
        Recipe.find_recommendations(@user)
        expect(@user.recommendations.count).to eq 1
        expect {
            @recipe.destroy
            @user.reload
        }.to change(@user.recommendations, :count).from(1).to(0)
    end

end
