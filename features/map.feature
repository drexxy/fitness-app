Feature: Find a gym with a google map

  Scenario: A customer finds gyms around their location
    Given a visitor is on the find gym page
    When they enter a postcode
    Then they are shown a map with gyms around that area on the map
