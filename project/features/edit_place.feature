Feature: User can edit his place
  As a User
  I want to edit my place
  So that I can modify errors or put changes

  Scenario: User edits his place
    Given I have created my place
    When I click on navbar menu
    And I click on "Casa Rollo"
    And I click on "Edit informations"
    And I fill in "Name" with "Casa Lowe"
    And I fill in "State" with "Italy"
    And I fill in "City" with "Rome"
    And I fill in "Address" with "Piazza dei sanniti 2"
    And I fill in "Cap" with "00185"
    And I press "Submit"
    Then I should see "Casa Lowe"
    And I should see "Piazza dei sanniti 2"
    And I should see "00185"