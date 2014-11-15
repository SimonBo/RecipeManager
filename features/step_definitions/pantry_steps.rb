Then(/^I can see what I have in my pantry$/) do
  ingredient = FactoryGirl.create(:ingredient, name: 'Onion')
  item = FactoryGirl.create(:item, user: @user, ingredient: ingredient)

  visit root_path
  expect(page).to have_content "Your pantry"
  expect(page).to have_content ingredient.name
end


Then(/^I see form for adding items$/) do
  expect(page).to have_content 'New item'
end

When(/^I add an item through the form$/) do
  name = Faker::Lorem.word
  fill_in "Name", :with => name
  fill_in "Amount", :with => 1
  click_button "Save"
end

Then(/^I see the new item in my pantry$/) do
  expect(page).to have_content name
end

Given(/^I have a few items in my pantry$/) do
  5.times do
    ingredient = FactoryGirl.create(:ingredient)
    item = FactoryGirl.create(:item, user: @user, ingredient: ingredient)
  end
end

Then(/^I see remove item button$/) do
  expect(page).to have_content "Remove item"
end

When(/^I click remove item button$/) do
  first('.user_item').click_link('Remove item')
end

Then(/^an items gets deleted$/) do
  expect(@user.items.count).to eq 4
end