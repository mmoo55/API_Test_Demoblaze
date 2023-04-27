Feature: Test Signup section
  Background:
    * def urlBase = 'https://api.demoblaze.com/signup'
    * def user = {username: 'pruebaNuevoUsuarioDevsu', password: '123Prueba'}

  Scenario: I want to create a new user
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

  Scenario: I want to try to create an user that already exist
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
    And match response.errorMessage == 'This user already exist.'