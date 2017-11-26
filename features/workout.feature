Feature: Workout

  Background:
    Given a personal trainer is registered
      And they have confirmed their account
      And they have logged in

  @javascript
  Scenario: A personal Trainer creates a workout
    Given there are some exercises
      And they have created a profile
      And the personal trainer has created some days
      And they are on the new workout page
      And they have filled out the workout form
      And they click on some days
    When they submit the form
    Then a workout is created

  @javascript
  Scenario: A Personal Trainer only sees the days they have made
    Given there are some exercises
      And they have created a profile
      And the personal trainer has created some days
      And another trainer has created a day
    When they visit the new workout page
      Then they see only the days they have made 
