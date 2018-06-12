
Given(/^I am a registered user$/) do
  User.create({:uid => 1, :email => "123456789@gmail.com", :password => "12345678", :password_confirmation => "12345678", :name => "Test", :surname => "Sur_test", :phone_number => "3331112345"})
end

When(/^I am on the login page$/) do
  visit "/login"
end

Given /^I am on the map page$/ do
  visit "/map"
end

Given (/^I am on the home page$/) do
  visit "/"
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should be on login page$/ do
  assert page.current_path == new_user_session_path
end

Then /^I should be on signup page$/ do
  assert page.current_path == login_path
end

Then /^I should be on users page$/ do
  assert page.current_path == user_registration_path
end

Then /^I should be on home page$/ do
  assert page.current_path == root_path
end

Then /^I should be on about page$/ do
  assert page.current_path == about_path
end

Then /^I should be on map page$/ do
  assert page.current_path == map_path
end

Given /^There is at least one place$/ do
  User.create({:uid => 1, :email => "123456789@gmail.com", :password => "12345678", :password_confirmation => "12345678", :name => "Test", :surname => "Sur_test", :phone_number => "3331112345"})
  Place.create(:id => 1, :name => "Casa Rollo", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 1)
end

When /^I click on "([^"]*)"$/ do |link|
  click_on(link)
end

Given(/^I am on the signup page$/) do
  visit "/login"
end

Then /^I should be on profile page$/ do
  assert page.current_path == profile_path
end

Given /^I log in$/ do
  steps %Q{
    Given I am a registered user
    And I am on the login page
    When I fill in "login_email" with "123456789@gmail.com"
    And I fill in "login_password" with "12345678"
    And I press "Log in"
    Then I should be on home page
  }
end

Given /^I have created my place$/ do
  steps %Q{
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
  }
end


Then /^I should display a map$/ do
  assert page.current_path == map_path
end

Then(/^I should be on edit profile page$/) do
  assert page.current_path == edit_profile_path
end

Then(/^I should be on my place page$/) do
  assert page.current_path == "places/1"
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    expect(page).to have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  assert !page.has_content?(text)
end

When(/^I click on navbar menu$/) do
  find("#navbarDropdown").click
end

And (/^Someone has created his place$/) do
  User.create({:uid => 2, :email => "12345678911@gmail.com", :password => "12345678", :password_confirmation => "12345678", :name => "Tester", :surname => "Sur_tester", :phone_number => "3331112345"})
  Place.create(:id => 1, :name => "Casa Temp", :state => "Italy", :city => "Rome", :address => "Via Ariccia 34", :cap => "00179", :description => "Temp place", :user_id => 2)
end