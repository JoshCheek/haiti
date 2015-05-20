require 'haiti/command_line_helpers'
require 'haiti/step_definitions'

# move this somewhere better
Before { Haiti::CommandLineHelpers.make_proving_grounds }

module GeneralHelpers
  def eval_curlies(string)
    string.gsub(/{{(.*?)}}/) { |match| eval match[2...-2] }
  end
end

World GeneralHelpers
