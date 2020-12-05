#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-09 18:46:52
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-12-04 19:36:58

require "ruby_utils/parameter_converter"
require "dwd_observations/data"

module DwdObservations

  # Child data reader class to read the observation data for:
  # * rain amount in mm per hour
  # * precipitation form {solid, liquid}
  class PrecipitationReader < DataReader

    private

    # method to create the measurand data from the input data   
    # @param [Array] data an array with the read data
    def read_data(data)
      data.each { |entry|
        precipitation = DwdObservations::Precipitation.new()
        precipitation.station_id = RubyUtils::ParameterConverter.convert_int_parameter(entry[0])
        precipitation.timestamp = RubyUtils::ParameterConverter.convert_time_parameter(entry[1])
        precipitation.quality_level = RubyUtils::ParameterConverter.convert_int_parameter(entry[2])
        precipitation.amount = RubyUtils::ParameterConverter.convert_float_parameter(entry[3])
        precipitation.rain_indicator = RubyUtils::ParameterConverter.convert_int_parameter(entry[4])
        precipitation.precipitation_form = RubyUtils::ParameterConverter.convert_int_parameter(entry[5])
        @data_repository.add_data_entry(precipitation)
      }
      nil
    end

  end

end
