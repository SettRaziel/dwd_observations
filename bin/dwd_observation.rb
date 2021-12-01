require "ruby_utils/string"
require "dwd_observations"

begin
  DwdObservations.initialize(ARGV)
  parameter_repository = DwdObservations.parameter_repository
  
  if (parameter_repository.parameters[:help])
    DwdObservations.print_help
  elsif (parameter_repository.parameters[:version])
    DwdObservations.print_version
  else
    puts DwdObservations.output_forecast
  end

rescue StandardError, NotImplementedError => e
  DwdObservations.print_error(e.message)
end
