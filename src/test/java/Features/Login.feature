Feature: Test Login section
  Background:
    * def urlBase = 'https://api.demoblaze.com/login'
    * def user = {username: 'pruebaNuevoUsuarioDevsu1', password: '123Prueba'}

    * def userError = {username: '13pruebaNuevoUsuarioDevsuError', password: '123Prueba12345'}

  Scenario: I want to login with correct credentials
    Given url urlBase
    When request
    """
    {
      "username":"#(user.username)",
      "password":"#(user.password)"
    }
    """
    And method POST
    Then status 200
    And match response contains 'Auth_token'

  Scenario: I want to try to login with incorrect credentials
    Given url urlBase
    When request
    """
    {
      "username":"#(userError.username)",
      "password":"#(userError.password)"
    }
    """
    And method POST
    Then status 200
    And match response.errorMessage == 'User does not exist.'