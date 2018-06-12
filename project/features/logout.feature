Feature: User can logout
  As a User
  I want to logout
  So that I'm no more signed in

  Scenario: User logout
    Given I am a registered user
    And I log in
    When I click on navbar menu
    And I click on "Logout"
    Then I should be on home page