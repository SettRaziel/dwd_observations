require "dwd_observations/data"
require "dwd_observations/help/help_output"
require "dwd_observations/json_converter"
require "dwd_observations/meta_data"
require "dwd_observations/parameter"
require "dwd_observations/reader"
require "dwd_observations/statistic"

# main module
module DwdObservations

  # Dummy class to get access to the instance variables
  class << self

    # @return [Parameter::ParameterHandler] the handler controlling the parameters
    attr_reader :parameter_handler

    # @return [DwdObservations::Reader] the reader holding the repository with the data
    attr_reader :data_reader

    # main entry point and initialization
    # @param [Array] arguments the input values from the terminal input ARGV
    def initialize(arguments)
      @parameter_handler = Parameter::ParameterHandler.new(arguments)
      if (!@parameter_handler.repository.parameters[:help] && 
          !@parameter_handler.repository.parameters[:version])
        initialize_data
      end
    end

    private

    # method to read the data for the given measurand
    def initialize_data
      measurand = @parameter_handler.repository.parameters[:measurand]
      filepath = @parameter_handler.repository.parameters[:file]
      meta_path = File.join(File.dirname(filepath), "Metadaten_Geographie.txt")
      @data_reader = DwdObservations::Reader.determine_reader_for(measurand, filepath, meta_path)
    end

  end

  # method for enable the logic for the provided parameters
  def self.handle_parameters
    if (@parameter_handler.repository.parameters[:json])
      converter = DwdObservations::JsonConverter::MeasurandConverter.new(@data_reader.data_repository)
      converter.convert(File.dirname(@parameter_handler.repository.parameters[:file]))
    end
    nil
  end

  # call to print the help text
  def self.print_help
    if (@parameter_handler.repository != nil && 
        @parameter_handler.repository.parameters[:help] != nil)
      DwdObservations::HelpOutput.print_help_for(@parameter_handler.repository.parameters[:help])
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
