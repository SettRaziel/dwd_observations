#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-08 20:30:43
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-12-06 20:35:17

module DwdObservations

  require "dwd_observations/reader/meta_reader"
  require "dwd_observations/reader/data_reader"
  require "dwd_observations/reader/precipitation_reader"
  require "dwd_observations/reader/pressure_reader"
  require "dwd_observations/reader/suntime_reader"
  require "dwd_observations/reader/temperature_reader"
  require "dwd_observations/reader/wind_reader"
  require "ruby_utils/string"
  
  # Factory module to generate the reader for a given measurand
  module Reader

    # module method to determine the reader for a given measurand
    # @param [String] measurand the string name of the provided measurand
    # @param [String] data_path the path to the data file
    # @param [String] meta_path the path to the meta data file
    # return [DataReader] the mapped reader class for the given measurand
    def self.determine_reader_for(measurand, data_path, meta_path)
      case measurand
      when "precipitation" then PrecipitationReader.new(data_path, meta_path)
      when "pressure" then PressureReader.new(data_path, meta_path)
      when "suntime" then SuntimeReader.new(data_path, meta_path)
      when "temperature" then TemperatureReader.new(data_path, meta_path)
      when "wind" then WindReader.new(data_path, meta_path)
      else
        raise ArgumentError, "Error: measurand parameter invalid.".red
      end

    end

  end

end
