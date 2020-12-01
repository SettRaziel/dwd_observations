#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-08 20:09:50
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-12-01 20:01:24

require "ruby_utils/parameter_converter"
require "dwd_observations/data"

module DwdObservations

  # Child data reader class to read the observation data for:
  # * the temperature in degree Celsius
  # * the humidity in percent
  class TemperatureReader < DataReader

    private

    # method to create the measurand data from the input data   
    # @param [Array] data an array with the read data
    def read_data(data)
      data.each { |entry|
        temperature = DwdObservations::Temperature.new()
        temperature.station_id = RubyUtils::ParameterConverter.convert_int_parameter(entry[0])
        temperature.timestamp = RubyUtils::ParameterConverter.convert_time_parameter(entry[1])
        temperature.quality_level = RubyUtils::ParameterConverter.convert_int_parameter(entry[2])
        temperature.temperature = RubyUtils::ParameterConverter.convert_float_parameter(entry[3])
        temperature.humidity = RubyUtils::ParameterConverter.convert_float_parameter(entry[4])
        @data_repository.add_data_entry(temperature)        
      }
      nil
    end

  end

end
