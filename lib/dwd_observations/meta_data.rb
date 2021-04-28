require "ruby_utils/meta_data"
require "ruby_utils/parameter_converter"

module DwdObservations

  # Data class to store the meta information of the observation station
  class MetaData < RubyUtils::MetaData

    # @return [Integer] the corresponding grid point
    attr_reader :station_id
    
    # @return [String] the information abount the station
    attr_reader :station_name

    # @return [Time] the start date and time of the data series
    attr_reader :start_date

    # initialization
    # @param [Array] header_line the head line of a data set holding the 
    # relevant meta information
    def initialize(header_line)
      super(header_line)
    end

    private

    # method which parses the required meta information from the 
    # head line    
    # @param [Array] header_line the head line of a data set holding the 
    # relevant meta information
    def parse_header(header_line)
      @station_id = RubyUtils::ParameterConverter.convert_int_parameter(header_line[0])
      @station_name = header_line[1].strip
      @start_date = RubyUtils::ParameterConverter.convert_time_parameter(header_line[2])
      nil
    end

  end

end
