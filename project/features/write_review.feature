Feature: User can add a review on a place
  As a User
  I want to add a review on a place
  So that I can display my liking

  Scenario: User can't add a review on his own place
    Given I have created my place
    And I click on navbar menu
    And I click on "Casa Rollo"
    Then I should not see "Write a review"

  Scenario: User adds a review on another user's place
    Given I am a registered user
    And I log in
    And Someone has created his place
    And I am on the map page
    And I click on "Goto &raequo"
    And I click on "Write a review"
    And I fill in "Comment" with "Wow"
    And I fill in "Rating" with "5"
    And I press "Create Review"
    Then I should see "Wow"