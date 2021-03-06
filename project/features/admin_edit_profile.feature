Feature: Admin can edit a user account
  As an Admin
  I want to edit an user's account
  So that I will change any unwanted content or errors

  Scenario: Admin edits user's account
    Given I am an admin
    And I login as an admin
    And Someone has created his place
    And I click on "Map"
    And I click on "goto_button"
    And I click on "Tester Sur_tester"
    And I click on "Edit user"
    And I fill in "Name" with "Paolo"
    And I press "Update"
    Then I should see "Paolo"