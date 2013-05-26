Feature:
  Scenario:
    Given the file "file1" "body{{0+1}}"
    When I run 'cat file1'
    Then stdout is "body1"

  Scenario:
    Given the file "file2":
    """
    body{{1+1}}
    """
    When I run 'cat file2'
    Then stdout is "body2"
