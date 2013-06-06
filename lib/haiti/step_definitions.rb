Given('the file "$filename" "$body"')        { |filename, body|       Haiti::CommandLineHelpers.write_file filename, eval_curlies(body) }
Given('the file "$filename":')               { |filename, body|       Haiti::CommandLineHelpers.write_file filename, eval_curlies(body) }
Given('the stdin content "$content"')        { |content|              @stdin_data = eval_curlies(content) }
Given('the stdin content:')                  { |content|              @stdin_data = eval_curlies(content) }
When('I run "$command"')                     { |command|              @last_executed = Haiti::CommandLineHelpers.execute command, @stdin_data }
When("I run '$command'")                     { |command|              @last_executed = Haiti::CommandLineHelpers.execute command, @stdin_data }
Then(/^(stderr|stdout) is:$/)                { |stream_name, output|  @last_executed.send(stream_name).chomp.should == eval_curlies(output) }
Then(/^(stderr|stdout) is ["'](.*?)["']$/)   { |stream_name, output|  @last_executed.send(stream_name).chomp.should == eval_curlies(output) }
Then(/^(stderr|stdout) is empty$/)           { |stream_name|          @last_executed.send(stream_name).should == '' }
Then(/^(stderr|stdout) is not empty$/)       { |stream_name|          @last_executed.send(stream_name).chomp.should_not be_empty }
Then(/^(stderr|stdout) includes "([^"]*)"$/) { |stream_name, content| @last_executed.send(stream_name).should include eval_curlies(content) }
Then(/^(stderr|stdout) includes:$/)          { |stream_name, content| @last_executed.send(stream_name).should include eval_curlies(content) }
Then('the exit status is $status')           { |status|               @last_executed.exitstatus.to_s.should == status }

Then(/^(stderr|stdout) does not include "([^"]*)"$/) { |stream_name, content| @last_executed.send(stream_name).should_not include eval_curlies(content) }
Then(/^(stderr|stdout) does not include:$/)          { |stream_name, content| @last_executed.send(stream_name).should_not include eval_curlies(content) }
