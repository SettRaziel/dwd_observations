#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-12 20:22:20
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-12-01 20:00:24

require "ruby_utils/parameter_converter"
require "dwd_observations/data"

module DwdObservations

  # Child data reader class to read the observation data for the suntime in minutes per hour
  class SuntimeReader < DataReader

    private

    # method to create the measurand data from the input data   
    # @param [Array] data an array with the read data
    def read_data(data)
      data.each { |entry|
        suntime = DwdObservations::Suntime.new()
        suntime.station_id = RubyUtils::ParameterConverter.convert_int_parameter(entry[0])
        suntime.timestamp = RubyUtils::ParameterConverter.convert_time_parameter(entry[1])
        suntime.quality_level = RubyUtils::ParameterConverter.convert_int_parameter(entry[2])
        suntime.sun_duration = RubyUtils::ParameterConverter.convert_float_parameter(entry[3])
        @data_repository.add_data_entry(suntime)        
      }
      nil
    end

  end

end
