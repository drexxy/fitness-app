Feature: Goals

  Scenario: An admin create a goal
    Given an admin is logged in
      And they are on the new goal page
      And they have filled in the name of the goal
    When They submit the new form
    Then a goal is added to the goals table