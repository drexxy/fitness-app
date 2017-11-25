Feature: Registering
  
  Scenario: A customer signs up
    Given they are on the sign up page
    When they provide their credentials
    And they sign up
  Then they will be registered but not confirmed
    And they recieve confirmation insturctions by email
  When they follow the confirmation link in the confirmation email
  Then they'll be redirected to the new profile page

  Scenario: A personal trainer signs up
    Given they are on the sign up page
    When they provide their credentials
      And they check the box to say they are a personal trainer
      And they sign up
  Then they will be registered but not confirmed
    And they recieve confirmation insturctions by email
  When they follow the confirmation link in the confirmation email
  Then they'll be redirected to the new trainer profile page