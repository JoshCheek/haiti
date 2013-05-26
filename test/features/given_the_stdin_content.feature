Feature:
  Scenario:
    Given the stdin content "content"
    When I run "cat"
    Then stdout is "content"

  Scenario:
    Given the stdin content:
    """
    some
    content
    """
    When I run "cat"
    Then stdout is:
    """
    some
    content
    """
