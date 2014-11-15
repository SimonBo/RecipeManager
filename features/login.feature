 Feature: Sign up and log in
   As a visitor to the site
   I want to be able to sign up
   And log in 

   Scenario: Sign up
     Given I am a visitor
     When I visit main site
     Then I should see a sign up button
     When I click "Sign up"
     Then I should see a sign up form
     When I fill in the sign up form
     And I click "Sign up" button
     Then I get redirected to main site
     And I see that I am logged in

  # Scenario: Log in
  #   Given I am a registered user
  #   And I am not logged in
  #   Then I should see "Log in" button
  #   When I click "Log in" button
  #   Then I should see a log in form
  #   When I fill in the log in form