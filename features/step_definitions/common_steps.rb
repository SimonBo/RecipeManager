Given(/^I am logged in$/) do
  visit root_path
  @user = FactoryGirl.create(:user)
  click_on 'Log in'
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Sign in'
end

When(/^I visit main site$/) do
  visit root_path
end

When(/^I click "(.*?)"$/) do |arg1|
  click_on arg1
end

When(/^I click "(.*?)" button$/) do |arg1|
  click_button 'Sign up'
end

Then(/^I get redirected to main site$/) do
  expect(current_path).to eq '/'
end