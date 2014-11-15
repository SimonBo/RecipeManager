When(/^fill in recipe form$/) do
  name = Faker::Lorem.word
  fill_in "Name", :with => name
  fill_in "Description", :with => Faker::Lorem.sentence

  click_on "Save"
end

Then(/^I can see my new recipe on site$/) do
  expect(page).to have_content name
end