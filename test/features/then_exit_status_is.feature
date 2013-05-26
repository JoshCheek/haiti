Feature:
  Scenario:
    When I run "true"
    Then the exit status is 0

  Scenario:
    When I run "false"
    Then the exit status is 1
