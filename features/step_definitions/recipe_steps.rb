When(/^fill in recipe form$/) do
  name = Faker::Lorem.word
  fill_in "Name", :with => name
  fill_in "Description", :with => Faker::Lorem.sentence

  click_on "add item"
  find('#items').visible?

  within("#items") do
    fill_in "Name", :with => Faker::Lorem.word
    fill_in "Amount", :with => 1
  end

  click_on "Save"
end

Then(/^I can see my new recipe on site$/) do
  expect(page).to have_content name
end

Given(/^I have some eggs and tomato in my pantry$/) do
  food = %w[egg olive_oil tomato chicken potato strawberry milk]
  amount = [3, 1000, 1]
  measure = %w[piece ml piece]
  food.each do |f|
    FactoryGirl.create(:ingredient, name: f)
  end

  Ingredient.first(3).each_with_index do |i, index|
    FactoryGirl.create(:item, user: @user, ingredient: i, amount: amount[index], measure: measure[index])
  end

  expect(@user.items.count).to eq 3
end

Given(/^there are a few recipes in db$/) do
  food = %w[egg  tomato olive_oil chicken potato cucumber strawberry milk sugar]
  amount = [3, 1000, 1]
  measure = %w[piece ml piece]
  recipe_names = %w[omelette chicken_shit smoothy]

  @recipe = FactoryGirl.create(:recipe, name: recipe_names[0])
  ing1 = FactoryGirl.create(:ingredient, name: food[0])
  ing2 = FactoryGirl.create(:ingredient, name: food[1])
  ing3 = FactoryGirl.create(:ingredient, name: food[2])

  @recipe.items << FactoryGirl.create(:item, ingredient: ing1, amount: 3, measure: 'piece')
  @recipe.items << FactoryGirl.create(:item, ingredient: ing2, amount: 1, measure: 'piece')
  @recipe.items << FactoryGirl.create(:item, ingredient: ing3, amount: 5, measure: 'ml')

  recipe1 = FactoryGirl.create(:recipe, name: recipe_names[1])
  ing1 = FactoryGirl.create(:ingredient, name: food[3])
  ing2 = FactoryGirl.create(:ingredient, name: food[4])
  ing3 = FactoryGirl.create(:ingredient, name: food[5])

  recipe1.items << FactoryGirl.create(:item, ingredient: ing1, amount: 200, measure: 'gr')
  recipe1.items << FactoryGirl.create(:item, ingredient: ing2, amount: 2, measure: 'piece')
  recipe1.items << FactoryGirl.create(:item, ingredient: ing3, amount: 1, measure: 'piece')

  recipe2 = FactoryGirl.create(:recipe, name: recipe_names[2])
  ing1 = FactoryGirl.create(:ingredient, name: food[6])
  ing2 = FactoryGirl.create(:ingredient, name: food[7])
  ing3 = FactoryGirl.create(:ingredient, name: food[8])

  recipe2.items << FactoryGirl.create(:item, ingredient: ing1, amount: 200, measure: 'gr')
  recipe2.items << FactoryGirl.create(:item, ingredient: ing2, amount: 200, measure: 'ml')
  recipe2.items << FactoryGirl.create(:item, ingredient: ing3, amount: 10, measure: 'gr')




  
end

Then(/^I see recommended dishes based on my pantry$/) do
  Recipe.find_recommendations(@user)
  within("#recommendations") do
    expect(page).to have_content @recipe.name
  end
end

