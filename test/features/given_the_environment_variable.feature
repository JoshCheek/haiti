Feature:
  Scenario:
    Given the environment variable "MY{{?_}}VAR" is set to "1/{{1+1}}/3"
    When I run "ruby -e 'print ENV[%(MY_VAR)]'"
    Then stdout is "1/2/3"

  Scenario:
    Given the environment variable "MY{{?_}}VAR" is set to '1/{{1+1}}/3'
    When I run "ruby -e 'print ENV[%(MY_VAR)]'"
    Then stdout is "1/2/3"
