#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-27 21:47:45
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-28 15:29:54

require "ruby_utils/statistic"
require "ruby_utils/string"

module DwdObservations

  module Statistic

    # Statistic class that take a data repository with data and generates the annual means for 
    # the specified years within the data set
    class MultiYear

      # initialization
      # @param [RubyUtils::DataRepository] data_repository the repository with the data
      def initialize(data_repository)
        @data_repository = data_repository
        @year_statistic = Year.new(@data_repository)
      end

      # create the month statistic values for the given month
      # @param [Symbol] measurand the measurand for which the data should be evaluated
      # @param [Integer] start_year the start year for the statistic
      # @param [Integer] range the number of year for the mutli statistic
      # @return [Float] the multi year mean for the given measurand
      def create_multi_year_statistic_for(measurand, start_year, range=30)
        means = @year_statistic.create_year_statistic_for(measurand)
        multi_mean = 0.0
        year_count = 0
        means.each_key { |key|
          if (key >= start_year && key < start_year + range)
            multi_mean = multi_mean + means[key]
            year_count += 1
          end
        }
        
        if (year_count != range)
          puts "Warning: Range #{range} given but only #{year_count} values evaluated."
        end

        (multi_mean / year_count).round(3)
      end

      private

      # @return [RubyUtils::DataRepository] the data repository with the data
      attr_reader :data_repository
      # @return [DwdObservations::Statistic::Year] a hash holding the data for every year so that the statistics can be
      # applied to it
      attr_reader :year_statistic

    end

  end

end
