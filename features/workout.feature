Feature: Workout

  Background:
    Given a personal trainer is logged in

  @javascript
  Scenario: A personal Trainer creates a workout
    Given there are some exercises
      And the personal trainer has created some days
      And they are on the new workout page
      And they have filled out the workout form
      And they click on some days
    When they submit the form
    Then a workout is created