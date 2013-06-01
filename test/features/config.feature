Feature: Configuring Haiti
  In order for Haiti to know how to put binaries in your path and where to execute,
  you must configure it.

  Scenario: bin is in path
    When I run "repeat_this_back_to_me thank you for your patience"
    Then stdout is "thank you for your patience"

  Scenario: execution happens in the proving grounds
    When I run "pwd"
    Then stdout is "{{Haiti.config.proving_grounds_dir}}"
    Given the file "my_file" "my_body"
    When I run "cat my_file"
    Then stdout is "my_body"
