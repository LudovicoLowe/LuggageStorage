Feature: User can edit his profile
  As a User
  I want to edit my profile
  So that I can put useful informations in it

  Scenario: Go to profile page
    Given I am a registered user
    And I log in
    When I click on navbar menu
    And I click on "Profile"
    Then I should be on profile page

  Scenario: Edit profile
    Given I am a registered user
    And I log in
    When I click on navbar menu
    And I click on "Edit profile"
    Then I should be on edit profile page