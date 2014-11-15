Given(/^I am a visitor$/) do

end

When(/^I visit main site$/) do
  visit root_path
end

Then(/^I should see a sign up button$/) do
  expect(page).to have_content 'Sign up'
end

When(/^I click "(.*?)"$/) do |arg1|
  click_on arg1
end

Then(/^I should see a sign up form$/) do
  expect(page).to have_content 'Password'
  expect(page).to have_content 'Password confirmation'
end

When(/^I fill in the sign up form$/) do
  @email = Faker::Internet.email
  fill_in "Email", :with => @email
  fill_in "Password", :with => 'useruser'
  fill_in "Password confirmation", :with => 'useruser'
end

When(/^I click "(.*?)" button$/) do |arg1|
  click_button 'Sign up'
end

Then(/^I get redirected to main site$/) do
  expect(current_path).to eq '/'
end

Then(/^I see that I am logged in$/) do
  expect(page).to have_content @email
end