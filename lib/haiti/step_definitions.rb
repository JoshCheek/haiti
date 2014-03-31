define_steps = lambda do |*matchers, &definition|
  matchers.each { |matcher| Given matcher, &definition }
end

define_steps.call(
  'the file "$filename" "$body"',
  'the file "$filename":'
) { |filename, body| Haiti::CommandLineHelpers.write_file filename, eval_curlies(body) }

define_steps.call(
  'the stdin content "$content"',
  'the stdin content:'
) { |content| @stdin_data = eval_curlies(content) }


define_steps.call(
  'I run "$command"',
  "I run '$command'",
) { |command| @last_executed = Haiti::CommandLineHelpers.execute command, @stdin_data }

define_steps.call(
  /^(stderr|stdout) is:$/,
  /^(stderr|stdout) is "([^"]*?)"$/,
  /^(stderr|stdout) is '([^']*?)'$/
) { |stream_name, output|  @last_executed.send(stream_name).chomp.should == eval_curlies(output) }

define_steps.call(
  /^(stderr|stdout) is empty$/
) { |stream_name| @last_executed.send(stream_name).should == '' }

define_steps.call(
  /^(stderr|stdout) is not empty$/
) { |stream_name| @last_executed.send(stream_name).chomp.should_not be_empty }

define_steps.call(
  /^(stderr|stdout) includes "([^"]*?)"$/
) { |stream_name, content| @last_executed.send(stream_name).should include eval_curlies(content) }

define_steps.call(
  /^(stderr|stdout) includes:$/
) { |stream_name, content| @last_executed.send(stream_name).should include eval_curlies(content) }

define_steps.call(
  'the exit status is $status'
) { |status| @last_executed.exitstatus.to_s.should == status }

define_steps.call(
  /^(stderr|stdout) does not include "([^"]*?)"$/,
  /^(stderr|stdout) does not include:$/
) { |stream_name, content| @last_executed.send(stream_name).should_not include eval_curlies(content) }

define_steps.call(
  /^I see the file "([^"]*?)" "([^"]*?)"$/,
  /^I see the file '([^']*?)' '([^']*?)'$/,
  /^I see the file '([^']*?)' "([^"]*?)"$/,
  /^I see the file "([^"]*?)" '([^']*?)'$/,
  /^I see the file '([^']*?)':$/,
  /^I see the file "([^"]*?)":$/
) { |filename, body| Haiti::CommandLineHelpers.read_file(filename).should == body }

define_steps.call(
  /^I see the file "([^"]*?)"$/,
  /^I see the file '([^']*?)'$/
) { |filename| Haiti::CommandLineHelpers.in_proving_grounds { File.exist?(filename).should be_true } }
