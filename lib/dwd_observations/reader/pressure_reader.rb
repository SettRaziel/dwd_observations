require "ruby_utils/parameter_converter"
require "dwd_observations/data"

module DwdObservations

  # Child data reader class to read the observation data for:
  # * pressure reduced to sea level
  # * pressure at station hight
  class PressureReader < DataReader

    private

    # method to create the measurand data from the input data   
    # @param [Array] data an array with the read data
    def read_data(data)
      data.each { |entry|
        pressure = DwdObservations::Pressure.new()
        pressure.station_id = RubyUtils::ParameterConverter.convert_int_parameter(entry[0])
        pressure.timestamp = RubyUtils::ParameterConverter.convert_time_parameter(entry[1])
        pressure.quality_level = RubyUtils::ParameterConverter.convert_int_parameter(entry[2])
        pressure.reduced_pressure = RubyUtils::ParameterConverter.convert_float_parameter(entry[3])
        pressure.station_pressure = RubyUtils::ParameterConverter.convert_float_parameter(entry[4])
        @data_repository.add_data_entry(pressure)        
      }
      nil
    end

  end

end
