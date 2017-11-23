Feature: Trainer

  Background: 
    Given a personal trainer is logged in

  Scenario: A trainer creates a profile
    Given they are on the new trainer profile page
      And they have filled out the trainer profile form
    When They submit the new form
    Then they create a profile in the database
      And they are redirected to their profile page