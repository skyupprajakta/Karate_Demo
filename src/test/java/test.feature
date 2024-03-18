Feature: API Testing using Karate
  Background:
    * url 'https://restful-booker.herokuapp.com'
    Given path '/auth'
    And request {"username" : "admin","password" : "password123"}
    And header Content-Type = 'application/json'
    When method POST
    Then status 200

    * def token = response.token

    * print 'Value of the token ' + token

  Scenario: Get all data
    Given path '/booking'
    When method GET
    Then status 200
    * print response

  Scenario: Update data
    Given path '/booking'
    And header Authorization = 'Bearer' + token
    And header Content-Type = 'application/json'
    And header accept = 'application/json'
    * def payload =
           """
            {"firstname" : "Jimmmy1",
             "lastname" : "Brothe",
             "totalprice" : 145,
             "depositpaid" : true,
             "bookingdates" : {
             "checkin" : "2018-01-01",
             "checkout" : "2019-01-01"
               },
             "additionalneeds" : "Breakfast"
             }
           """
    And request payload
    When method POST
    Then status 200
    * print response
    * def id = response.bookingid
    * print id
