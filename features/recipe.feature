Feature: Recipes
  As a user
  I can view/add/delete recipes

  # @javascript
  # Scenario: Add new recipe
  #   Given I am logged in
  #   And I visit main site
  #   Then I see "Add recipe" button
  #   When I click "Add recipe" button
  #   And fill in recipe form
  #   Then I can see my new recipe on site

  Scenario: Get recipe recommendations
    Given I am logged in
    And I have some eggs and tomato in my pantry
    And there are a few recipes in db
    And I visit main site
    Then I see recommended dishes based on my pantry

  