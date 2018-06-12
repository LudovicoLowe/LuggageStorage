Feature: User can delete his place
  As a User
  I want to delete my place
  So that it won't be anymore on the site

  Scenario: User deletes his place
    Given I have created my place
    When I click on navbar menu
    And I click on "Casa Rollo"
    And I click on "Delete place"
    Then I should be on home page