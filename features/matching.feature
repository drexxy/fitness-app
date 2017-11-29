Feature: Matching

  Background:
    Given a customer is registered
      And they have confirmed their account
      And they have logged in
      And There are some goals
      And there are some exercises
      And they have created a profile with a goal
      And there are some workouts

  @javascript
  Scenario: A customer finds a workout based on their needs
    Given they are viewing their profile
    When they click on the Find Workouts Button
    Then they are shown a list of workouts that fufill their criteria

  @javascript
  Scenario: A customer sets a workout as their current workout
    Given they are viewing the workout matching page
    When they click to select a workout
    Then their choice of workout appears on their profile page  