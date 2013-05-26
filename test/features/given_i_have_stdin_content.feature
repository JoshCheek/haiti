Feature:
  Scenario:
    Given I have the stdin content "content"
    When I run "cat"
    Then stdout is "content"

  Scenario:
    Given I have the stdin content:
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
