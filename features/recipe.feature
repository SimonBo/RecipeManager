Feature: Recipes
  As a user
  I can view/add/delete recipes

  Scenario: Add new recipe
    Given I am logged in
    And I visit main site
    Then I see "Add recipe" button
    When I click "Add recipe" button
    And fill in recipe form
    Then I can see my new recipe on site