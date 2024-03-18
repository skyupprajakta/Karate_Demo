Feature: Authentication Token
  Scenario: Create Token
    * url 'https://restful-booker.herokuapp.com'

    Given path '/auth'
    And request {"username" : "admin","password" : "password123"}
    And header Content-Type = 'application/json'
    When method POST
    Then status 200
    * def token = response.token
    * print 'Value of the token ' + token