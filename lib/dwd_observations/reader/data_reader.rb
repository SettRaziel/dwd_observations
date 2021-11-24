require "time"
require "ruby_utils/file_reader"
require "ruby_utils/data_repository"
require "ruby_utils/string"

module DwdObservations

  # Abstract data reader class to read the observation data for the different measurands
  class DataReader

    # @return [RubyUtils::DataRepository] the data repository with the data
    attr_reader :data_repository
    # @return [DwdObservations::DataReader::TimePeriod] the time interval with observation data
    attr_reader :time_period

    # initialization
    # @param [String] data_path the path to the observation data
    # @param [String] meta_path the path to the meta data
    def initialize(data_path, meta_path)
      meta_data = DwdObservations::MetaReader.new(meta_path).meta_data
      @data_repository = RubyUtils::DataRepository.new(meta_data)
      # drop the first element since it holds the column informations
      read_data(RubyUtils::FileReader.new(data_path, ";").data.drop(1))
      @time_period = TimePeriod.new(data_repository.repository.first.timestamp, 
                                    data_repository.repository.last.timestamp)
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

  # Simple data class to represent a timespan with a start and end date
  class TimePeriod

    # @return [Time] the start time of the intervall
    attr_reader :start_time
    # @return [Time] the end time of the intervall
    attr_reader :end_time

    # initialization
    # @param [Time] start_time the start time of the intervall
    # @param [Time] end_time the end time of the intervall    
    def initialize(start_time, end_time)
      @start_time = start_time
      @end_time = end_time
    end

  end

end
