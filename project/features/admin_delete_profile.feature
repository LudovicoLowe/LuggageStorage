Feature: Admin can delete an user's account
  As an Admin
  I want to delete an user's account
  So that he won't be able to use the site as a user

  Scenario: Admin edits user's account
    Given I am an admin
    And I login as an admin
    And Someone has created his place
    And I click on "Map"
    And I click on "goto_button"
    And I click on "Tester Sur_tester"
    And I click on "Edit user"
    And I press "Delete account"
    Then I should see "Nearest places"