Feature: Find lost Kittens

  Scenario: We send a search party and find the lost kitten
    Given accurate forensic data is available
    When we send a search party to the correct location
    Then the kitten is found
