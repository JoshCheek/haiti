Feature:

  Background:
    Given the file "the_file_i_see" "body"
  Scenario: I see the file, single, no body
    Then I see the file 'the_file_i_see'
  Scenario: I see the file, double, no body
    Then I see the file "the_file_i_see"
  Scenario: I see the file with single single
    Then I see the file 'the_file_i_see' 'body'
  Scenario: I see the file with double double
    Then I see the file "the_file_i_see" "body"
  Scenario: I see the file with single double
    Then I see the file 'the_file_i_see' "body"
  Scenario: I see the file with double single
    Then I see the file "the_file_i_see" 'body'
  Scenario: I see the file with single quotes and a "heredoc"
    Then I see the file 'the_file_i_see':
    """
    body
    """
  Scenario: I see the file with double quotes and a "heredoc"
    Then I see the file "the_file_i_see":
    """
    body
    """
