#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-08 20:12:21
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-08 20:24:25

require 'ruby_utils/file_reader'
require "dwd_observations/meta_data"

module DwdObservations

  # Simple data reader class to read the meta data for a given station
  class MetaReader

    # @return [DwdObservations::MetaData] the created meta data
    attr_reader :meta_data

    # initialization
    # @param [String] data_path the path to the meta data of the station
    def initialize(data_path)
      data = RubyUtils::FileReader.new(data_path, ";").data
      # since the fist line is the column description the second line holds the meta data
      @meta_data = MetaData.new(data[1])
    end

  end

end
