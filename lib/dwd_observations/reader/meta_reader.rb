require 'ruby_utils/file_reader'
require "dwd_observations/meta_data"

module DwdObservations

  # Simple data reader class to read the meta data for a given station
  class MetaReader

    # @return [DwdObservations::MetaData] the created meta data
    attr_reader :meta_data

    # initialization
    # @param [String] data_path the path to the meta data of the station
    # @param [String] measurand the measurand description for the observation data
    def initialize(data_path, measurand)
      data = RubyUtils::FileReader.new(data_path, ";").data
      # since the last line holds the latest meta information for the station use these
      @meta_data = MetaData.new(data.last, measurand, data[1][4])
    end

  end

end
