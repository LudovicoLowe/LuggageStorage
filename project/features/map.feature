Feature: Visitor/User can see all the place
  As a Visitor/User
  I want to check all the places
  So that I can select one and contact the owner

  Scenario: Go to the map page
    Given I am on the home page
    And There is at least one place
    When I click on "Map"
    Then I should be on map page
