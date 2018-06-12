Feature: Visitor/User displays the map
  As a Visitor/User
  I want to display the map of a place
  So that I can see where it is on the map

  Scenario: Display the map of a place
    Given There is at least one place
    And I am on the map page
    When I click on "Show"
    Then I should display a map