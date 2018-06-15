Feature: Admin can edit user's place
  As an Admin
  I want to edit an user's place
  So that I will change any unwanted content or errors

  Scenario: Admin edits user's place
    Given I am an admin
    And I login as an admin
    And Someone has created his place
    And I click on "Map"
    And I click on "goto_button"
    And I click on "Edit informations"
    And I fill in "Name" with "Casa Rollone"
    And I press "Submit"
    Then I should see "Casa Rollone"