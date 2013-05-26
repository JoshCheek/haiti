Feature:
  Scenario:
    When I run "echo hi"
    Then stdout is "hi"

  Scenario:
    When I run 'echo bye'
    Then stdout is "bye"
