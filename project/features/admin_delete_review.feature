Feature: Admin can delete an user review
  As an Admin
  I want to delete an user review
  So that I will delete any unwanted content

  Scenario: Admin deletes user review
    Given I am an admin
    And I login as an admin
    And Someone has created his place
    And That place has been reviewed
    And I click on "Map"
    And I click on "goto_button"
    And I click on "Delete"
    Then I should not see "Wow"