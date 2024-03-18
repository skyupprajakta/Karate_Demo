Feature: API Testing
  Background:
    * url 'https://reqres.in'

    Scenario: Get all users data
      Given path '/api/users?page=2'
      When method GET
      Then status 200
      * print response

    Scenario: Create new user
      Given path '/api/users'
      And request '{ "name": "morpheus", "job": "leader" }'
      When method POST
      Then status 201
      * def id = response.id
      * print id

    Scenario: Update User
      Given path '/api/users/<id>'
      And request
      """
        { "name": "Mark",
        "job": "Teacher"}
      """
      When method PUT
      Then status 200
      And print response
      And match response.name != "morpheus"
      And match response.job != "zion resident"

     @ignore
     Scenario: Delete user
       Given path '/api/users/<id>'
       When method DELETE
       Then status 204

