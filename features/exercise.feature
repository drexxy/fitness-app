Feature: Exercise

  Background:
    Given an admin is logged in

  Scenario: An admin adds an exercise to the exercise table
    Given an admin is on the new exercise page
      And they have filled out the form
    When They submit the new form
    Then an exercise is created
      And they are redirected to the exercise show page

   Scenario: An admin adds a duplicate exercise
    Given there is already an exercise
      And an admin is on the new exercise page
      And they have filled out the form
    When They submit the new form
    Then they are redirected to the new exercise page
      And they are shown an error message

    Scenario: A visitor views the exercise index
      Given there are some exercises
      When a visitor is on the exercise index page
      Then they see a paginated list of exercises
      When they click on page 2
      Then they see another 10 exercises
      When they click on 20 exercises per page
      Then they see a list of 20 exercises
