Feature: User's pantry
  As a user
  I want to be able to add items to my pantry
  And see/edit/delete it's content
  And find recipes that match my pantry

  Scenario: Pantry content
    Given I am logged in
    When I visit main site
    Then I can see what I have in my pantry

  Scenario: Adding items
    Given I am logged in
    When I visit main site
    Then I see "Add item" button
    When I click "Add item" button
    Then I see form for adding items
    When I add an item through the form
    Then I see the new item in my pantry

  Scenario: Delete items
    Given I am logged in
    And I have a few items in my pantry
    When I visit main site
    Then I see remove item button
    When I click remove item button
    Then an items gets deleted