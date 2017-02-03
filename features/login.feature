Feature: Login

Scenario: Login with username and password
  Given Give I type Username and Password
  Then I touch the "Login" button
  Then I wait
  And I take picture
  Then I press "OK"

