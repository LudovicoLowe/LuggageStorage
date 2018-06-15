Feature: Visitor can learn about the site
  As a Visitor
  I want to learn about the site
  So that I can know how it works

  Scenario: Go to the about page
    Given I am on the home page
    When I click on "About"
    Then I should see "Contacts"