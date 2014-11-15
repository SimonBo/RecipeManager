Feature: User's pantry
  As a user
  I want to be able to add items to my pantry
  And see/edit/delete it's content
  And find recipes that match my pantry

  Scenario: Pantry content
    Given I am logged in
    When I visit main site
    Then I can see what I have in my pantry