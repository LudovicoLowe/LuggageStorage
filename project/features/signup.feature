Feature: Visitor can create a new account
  As a visitor
  I want to create a new account
  So that the system can remember me

  Scenario: Create a new account
    Given I am on the signup page
    When I fill in "reg_email" with "123456789@gmail.com"
    And I fill in "reg_name" with "Test"
    And I fill in "reg_surname" with "Sur_test"
    And I fill in "reg_phone" with "3281743104"
    And I fill in "reg_psw" with "12345678"
    And I fill in "reg_conf_psw" with "12345678"
    And I press "Sign up"
    Then I should be on home page

  Scenario: Can't create a new account (name required)
    Given I am on the signup page
    When I fill in "reg_name" with "Test"
    And I fill in "reg_surname" with "Sur_test"
    And I fill in "reg_phone" with "3281743104"
    And I fill in "reg_psw" with "12345678"
    And I fill in "reg_conf_psw" with "12345678"
    And I press "Sign up"
    Then I should be on users page