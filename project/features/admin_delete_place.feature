Feature: Admin can delete user's place
  As an Admin
  I want to delete an user's place
  So that It won't be anymore on the website

  Scenario: Admin delete user's place
    Given I am an admin
    And I login as an admin
    And Someone has created his place
    And I click on "Map"
    And I click on "goto_button"
    And I click on "Delete place"
    Then I should be on home page