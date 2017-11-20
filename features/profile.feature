Feature: Profile

  Background: 
    Given a customer is logged in

  Scenario: A customer creates a profile with their information
    Given They are on the new profile page
      And They have filled out all required fields
    When They submit the new form
    Then Their profile is created
      And They are redirected to their profile page

  Scenario: A customer creates a profile with an invalid username
    Given They are on the new profile page
      And They have filled out the username field with an invalid name
    When They submit the new form
    Then They are returned to the new profile page
      And they are shown an error message stating the problem

  Scenario: A customer adds a goal to their profile
    Given There are some goals
    Given They are on the new profile page
      And They have filled out all required fields
      And They select a goal from the drop down menu
    When They submit the new form
    Then Their profile is created
      And They are redirected to their profile page
      And They see thier goal
               