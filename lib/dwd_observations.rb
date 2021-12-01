require "dwd_observations/data"
require "dwd_observations/meta_data"
require "dwd_observations/parameter"
require "dwd_observations/reader"
require "dwd_observations/statistic"
require "dwd_observations/help/help_output"

# main module
module DwdObservations

  # Dummy class to get access to the instance variables
  class << self

    # @return [Parameter::ParameterRepository] the handler controlling the parameters
    attr_reader :parameter_repository

    # main entry point and initialization
    # @param [Array] arguments the input values from the terminal input ARGV
    def initialize(arguments)
      @parameter_repository = Parameter::ParameterRepository.new(arguments)
    end

  end

  # call to print the help text
  def self.print_help
    if (@parameter_repository != nil && @parameter_repository.parameters[:help] != nil)
      DwdObservations::HelpOutput.print_help_for(@parameter_repository.parameters[:help])
    else
      print_error("Error: Module not initialized. Run DwdObservations.new(ARGV)")
    end
    nil
  end

  # call to print version number and author
  def self.print_version
    puts "dwd_observations version 0.0.1".yellow
    puts "Created by Benjamin Held (November 2020)".yellow
    nil
  end


  # call for standard error output
  # @param [String] message message string with error message
  def self.print_error(message)
    puts "#{message}".red
    puts "For help type: ruby <script> --help".green
    nil
  end

end
