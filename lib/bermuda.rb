require 'bermuda/config'
require 'bermuda/command_line_helpers'
require 'bermuda/step_definitions'

# move this somewhere better
Before { Bermuda::CommandLineHelpers.make_proving_grounds }

module GeneralHelpers
  def eval_curlies(string)
    string.gsub(/{{(.*?)}}/) { eval $1 }
  end
end

World GeneralHelpers
