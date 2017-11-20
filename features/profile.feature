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

  Scenario: A customer states how many days a week they train
    Given They are on the new profile page
      And They have filled out all required fields
      And They select the number of days they train
    When They submit the new form
    Then Their profile is created
      And They are redirected to their profile page
      And They see the number of days listed

    Scenario: A customer states their level of experience
    Given They are on the new profile page
      And They have filled out all required fields
      And They select their level of experience
    When They submit the new form
    Then Their profile is created
      And They are redirected to their profile page
      And They see their level of experience listed

    Scenario: A customer uploads a picture of themselves
    Given They are on the new profile page
      And They have filled out all required fields
      And They upload a picture of themselves
    When They submit the new form
    Then Their profile is created
      And They are redirected to their profile page
      And They see their picture on their profile page
               