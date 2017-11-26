Feature: Trainer

  Background: 
    Given a personal trainer is registered
      And they have confirmed their account
      And they have logged in

  Scenario: A trainer creates a profile
    Given they are on the new trainer profile page
      And they have filled out the trainer profile form
    When They submit the new form
    Then they create a profile in the database
      And they are redirected to their profile page

  Scenario: A trainer sees a list of their workouts on their profile
    Given the trainer has a profile
      And they have created some workouts
    When they view their profile page
    Then they see a list of their workouts