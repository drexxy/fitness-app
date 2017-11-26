Feature: Day

  Background:
    Given a personal trainer is registered
      And they have confirmed their account
      And they have logged in

  @javascript
  Scenario: A personal trainer creates a day of exercises
    Given they have created a profile
      And there are some exercises
      And they are on the new day page
      And they click on the form to add exercises to the day
      And they fill in the form
    When they submit the form
    Then they create a day in the database
      And they are redirected to the day index page

   Scenario: A personal trainer tries to create a day without making a profile
      When they visit the new day page
      Then they are redirected to the new trainer profile page
        And they are shown an error message telling them to create a profile first

  @javascript
  Scenario: A personal trainer views all the days they have made
    Given they have created a profile
      And there are some exercises
      And the personal trainer has created some days
      And another trainer has created a day
    When they visit the day index page
    Then they see only the days they have made 
