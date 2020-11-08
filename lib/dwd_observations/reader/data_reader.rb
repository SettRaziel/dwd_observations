#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-07 18:00:04
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-08 20:33:03

require "ruby_utils/file_reader"
require "ruby_utils/data_repository"
require "dwd_observations/reader"

module DwdObservations

  # Abstract data reader class to read the observation data for the different measurands
  class DataReader

    # @return [RubyUtils::DataRepository] the data repository with the data
    attr_reader :data_repository

    # initialization
    # @param [String] data_path the path to the observation data
    def initialize(data_path, meta_path)
      meta_data = DwdObservations::MetaReader.new(meta_path).meta_data
      @data_repository = RubyUtils::DataRepository.new(meta_data)
      read_data(RubyUtils::FileReader.new(data_path, ";").data)
    end

    private

    # abstract method which parses the required meta information from the 
    # head line    
    # @abstract subclasses need to implement this method
    # @param [Array] data an array with the read data
    def read_data(data)
      fail NotImplementedError, " Error: the subclass #{self.class} needs " \
      "to implement the method: read_data from its base class".red
    end

  end

end
