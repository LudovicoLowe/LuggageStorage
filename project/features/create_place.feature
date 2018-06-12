Feature: User creates his place
  As a User
  I want to create a place
  So that people can contact me

  Scenario: User creates the place
    Given I am a registered user
    And I log in
    When I click on navbar menu
    And I click on "Create place"
    And I fill in "Name" with "Casa Rollo"
    And I fill in "State" with "Italy"
    And I fill in "City" with "Rome"
    And I fill in "Address" with "Via Ariccia 34"
    And I fill in "Cap" with "00179"
    And I fill in "Description" with "My house"
    And I press "Submit"
    Then I should see "Informations"
    And I should see "Place Pictures"
    And I should see "Reviews"