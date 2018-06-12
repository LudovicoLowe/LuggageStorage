Feature: User can login to the system
  As a registered user
  I want to log in the system
  So that I can use its features

  Scenario: Login success
    Given I am a registered user
    And I am on the login page
    When I fill in "login_email" with "123456789@gmail.com"
    And I fill in "login_password" with "12345678"
    And I press "Log in"
    Then I should be on home page

  Scenario: Login failed
    Given I am on the login page
    When I fill in "login_email" with "aaabbbccc@gmail.com"
    And I fill in "login_password" with "zzz999123"
    And I press "Log in"
    Then I should be on login page