Feature: Day

  Background:
    Given a personal trainer is logged in

  @javascript
  Scenario: A personal trainer creates a day of exercises
    Given there are some exercises
      And they are on the new day page
      And they click on the form to add exercises to the day
    When they submit the form
    Then they create a day in the database
      And they are redirected to the day show page