Feature: User can delete his account
  As a User
  I want to delete my account
  So that I won't be anymore on the website

  Scenario: User deletes his account
    Given I am a registered user
    And I log in
    When I click on navbar menu
    And I click on "Edit profile"
    And I click on "Delete account"
    Then I should be on home page