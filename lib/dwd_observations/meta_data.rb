require "ruby_utils/meta_data"
require "ruby_utils/parameter_converter"
require "dwd_observations/entity"

module DwdObservations

  # Data class to store the meta information of the observation station
  class MetaData < RubyUtils::MetaData

    # @return [DwdObservations::Entity::Station] the corresponding grid point
    attr_reader :station

    # @return [Time] the start date of the first data measurement at this station
    attr_reader :start_date

    # initialization
    # @param [Array] header_line the head line of a data set holding the relevant meta information
    # @param [String] start_date the start date for the first data value of the station 
    def initialize(header_line, start_date=nil)
      super(header_line)
      if (start_date != nil)
        @start_date = RubyUtils::ParameterConverter.convert_time_parameter(start_date)
      end
    end

    private

    # method which parses the required meta information from the 
    # head line    
    # @param [Array] header_line the head line of a data set holding the 
    # relevant meta information
    def parse_header(header_line)
      station_id = RubyUtils::ParameterConverter.convert_int_parameter(header_line[0])
      station_heigth = RubyUtils::ParameterConverter.convert_float_parameter(header_line[1])
      station_latitude = RubyUtils::ParameterConverter.convert_float_parameter(header_line[2])
      station_longitude = RubyUtils::ParameterConverter.convert_float_parameter(header_line[3])
      @start_date = RubyUtils::ParameterConverter.convert_time_parameter(header_line[4])
      station_name = header_line[6].strip
      geo_coordinate = DwdObservations::Entity::Coordinate.new(station_longitude, station_latitude)
      @station = DwdObservations::Entity::Station.new(station_name, station_id, station_heigth, geo_coordinate)
      nil
    end

  end

end
