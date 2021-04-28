require "ruby_utils/file_reader"
require "ruby_utils/data_repository"
require "ruby_utils/string"

module DwdObservations

  # Abstract data reader class to read the observation data for the different measurands
  class DataReader

    # @return [RubyUtils::DataRepository] the data repository with the data
    attr_reader :data_repository

    # initialization
    # @param [String] data_path the path to the observation data
    # @param [String] meta_path the path to the meta data
    def initialize(data_path, meta_path)
      meta_data = DwdObservations::MetaReader.new(meta_path).meta_data
      @data_repository = RubyUtils::DataRepository.new(meta_data)
      # drop the first element since it holds the column informations
      read_data(RubyUtils::FileReader.new(data_path, ";").data.drop(1))
    end

    private

    # abstract method to create the measurand data from the input data
    # @abstract subclasses need to implement this method
    # @param [Array] data an array with the read data
    def read_data(data)
      fail NotImplementedError, " Error: the subclass #{self.class} needs " \
      "to implement the method: read_data from its base class".red
    end

  end

end
