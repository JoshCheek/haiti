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
) { |stream_name, output|  expect(@last_executed.send(stream_name).chomp).to eq eval_curlies(output) }

define_steps.call(
  /^(stderr|stdout) is empty$/
) { |stream_name| expect(@last_executed.send(stream_name)).to eq '' }

define_steps.call(
  /^(stderr|stdout) is not empty$/
) { |stream_name| expect(@last_executed.send(stream_name).chomp).to_not be_empty }

define_steps.call(
  /^(stderr|stdout) includes "([^"]*?)"$/
) { |stream_name, content| expect(@last_executed.send(stream_name)).to include eval_curlies(content) }

define_steps.call(
  /^(stderr|stdout) includes:$/
) { |stream_name, content| expect(@last_executed.send(stream_name)).to include eval_curlies(content) }

define_steps.call(
  'the exit status is $status'
) { |status| expect(@last_executed.exitstatus.to_s).to eq status }

define_steps.call(
  /^(stderr|stdout) does not include "([^"]*?)"$/,
  /^(stderr|stdout) does not include:$/
) { |stream_name, content| expect(@last_executed.send(stream_name)).to_not include eval_curlies(content) }

define_steps.call(
  /^I see the file "([^"]*?)" "([^"]*?)"$/,
  /^I see the file '([^']*?)' '([^']*?)'$/,
  /^I see the file '([^']*?)' "([^"]*?)"$/,
  /^I see the file "([^"]*?)" '([^']*?)'$/,
  /^I see the file '([^']*?)':$/,
  /^I see the file "([^"]*?)":$/
) { |filename, body| expect(Haiti::CommandLineHelpers.read_file(filename)).to eq body }

define_steps.call(
  /^I see the file "([^"]*?)"$/,
  /^I see the file '([^']*?)'$/
) { |filename|
  expect(
    Haiti::CommandLineHelpers.in_proving_grounds { File.exist? filename }
  ).to eq true
}
