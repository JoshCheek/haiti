Feature:

  # stdout is ...
  Scenario: stdout single quotes
    When I run "ruby -e 'puts %(hi)'"
    Then stdout is 'hi'

  Scenario: stdout double quotes
    When I run "ruby -e 'puts %(hi)'"
    Then stdout is "hi"

  Scenario: stdout multiline
    When I run "ruby -e 'puts %(hi), %(bye)'"
    Then stdout is:
    """
    hi
    bye
    """

  # stderr is ...
  Scenario: stderr single quotes
    When I run "ruby -e '$stderr.puts %(hi)'"
    Then stderr is 'hi'

  Scenario: stderr double quotes
    When I run "ruby -e '$stderr.puts %(hi)'"
    Then stderr is "hi"

  Scenario: stderr multiline
    When I run "ruby -e '$stderr.puts %(hi), %(bye)'"
    Then stderr is:
    """
    hi
    bye
    """

  # stdout is / is not empty
  Scenario: stdout is empty
    When I run "ruby -e ''"
    Then stdout is empty

  Scenario: stdout is not empty
    When I run "ruby -e '$stdout.puts %(a)'"
    Then stdout is not empty

  # stderr is / is not empty
  Scenario: stderr is empty
    When I run "ruby -e ''"
    Then stdout is empty

  Scenario: stderr is not empty
    When I run "ruby -e '$stderr.puts %(a)'"
    Then stderr is not empty

  # stdout includes
  Scenario: stdout includes
    When I run "ruby -e '$stdout.puts %(abc)'"
    Then stdout includes "b"

  # stderr includes
  Scenario: stderr includes
    When I run "ruby -e '$stderr.puts %(abc)'"
    Then stderr includes "b"
