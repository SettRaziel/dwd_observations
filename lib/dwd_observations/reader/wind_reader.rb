require "ruby_utils/parameter_converter"
require "dwd_observations/data"

module DwdObservations

  # Child data reader class to read the observation data for:
  # * wind speed in meter per second
  # * wind direction in degree
  class WindReader < DataReader

    private

    # method to create the measurand data from the input data   
    # @param [Array] data an array with the read data
    def read_data(data)
      data.each { |entry|
        wind = DwdObservations::Wind.new()
        wind.station_id = RubyUtils::ParameterConverter.convert_int_parameter(entry[0])
        wind.timestamp = RubyUtils::ParameterConverter.convert_time_parameter(entry[1])
        wind.quality_level = RubyUtils::ParameterConverter.convert_int_parameter(entry[2])
        wind.speed = RubyUtils::ParameterConverter.convert_float_parameter(entry[3])
        wind.direction = RubyUtils::ParameterConverter.convert_int_parameter(entry[4])
        @data_repository.add_data_entry(wind)        
      }
      nil
    end

  end

end
