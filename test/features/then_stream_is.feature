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
  Scenario: stdout includes inline, double quotes
    When I run "ruby -e '$stdout.puts [97, 39, 98, 39, 99].map(&:chr).join'"
    Then stdout includes "'b'"

  Scenario: stdout includes inline, single quotes
    When I run "ruby -e '$stdout.puts [97, 34, 98, 34, 99].map(&:chr).join'"
    Then stdout includes '"b"'

  Scenario: stdout includes multiline
    When I run "ruby -e '5.times { |i| $stdout.puts i }'"
    Then stdout includes:
    """
    2
    3
    """

  # stderr includes
  Scenario: stderr includes inline, double quotes
    When I run "ruby -e '$stderr.puts [97, 39, 98, 39, 99].map(&:chr).join'"
    Then stderr includes "'b'"

  Scenario: stderr includes inline, single quotes
    When I run "ruby -e '$stderr.puts [97, 34, 98, 34, 99].map(&:chr).join'"
    Then stderr includes '"b"'

  Scenario: stderr includes multiline
    When I run "ruby -e '5.times { |i| $stderr.puts i }'"
    Then stderr includes:
    """
    2
    3
    """

  # stdout does not include
  Scenario: stdout does not include, inline, double quotes
    When I run "ruby -e '$stdout.puts %(abc)'"
    Then stdout does not include "'b'"

  Scenario: stdout does not include, inline, single quotes
    When I run "ruby -e '$stdout.puts %(abc)'"
    Then stdout does not include '"b"'

  Scenario: stdout does not include multiline
    When I run "ruby -e '5.times { |i| $stdout.puts i }'"
    Then stdout does not include:
    """
    3
    2
    """

  # stderr does not include
  Scenario: stderr does not include inline, double quotes
    When I run "ruby -e '$stderr.puts %(abc)'"
    Then stderr does not include "'b'"

  Scenario: stderr does not include inline, single quotes
    When I run "ruby -e '$stderr.puts %(abc)'"
    Then stderr does not include '"b"'

  Scenario: stderr does not include multiline
    When I run "ruby -e '5.times { |i| $stderr.puts i }'"
    Then stderr does not include:
    """
    3
    2
    """

