#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-19 19:37:51
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-22 16:13:55

require "ruby_utils/statistic"
require "ruby_utils/string"

module DwdObservations

  module Statistic

    # Statistic class that take a data repository with data and generates the mean for a given month
    # per year that is present within the data set
    class Month

      # initialization
      # @param [RubyUtils::DataRepository] data_repository the repository with the data
      def initialize(data_repository)
        @data_repository = data_repository
      end

      # create the month statistic values for the given month
      # @param [Integer] month the integer representation of the given month
      # @param [Symbol] measurand the measurand for which the data should be evaluated
      def create_month_statistic_for(month, measurand)
        create_data(month)
        generate_month_means(measurand)
      end

      private

      # @return [RubyUtils::DataRepository] the data repository with the data
      attr_reader :data_repository
      # @return [Hash] a hash holding the data for a given month so that the statistics can be
      # applied to it
      attr_reader :month_statistic

      # method the extract the data from the observations for the given month
      # @param [Integer] month the integer representation of the given month
      def create_data(month)
        @month_statistic = Hash.new()
        data_repository.repository.each { |entry|
          timestamp = entry.timestamp
          if (timestamp.month == month)
            if (@month_statistic[timestamp.year] == nil)
              @month_statistic[timestamp.year] = Array.new()
            end
            @month_statistic[timestamp.year] << entry
          end
        }
        nil
      end

      # method to create the monthly means for the given observation data
      # @param [Symbol] measurand the measurand for which the data should be evaluated
      # @return [Hash] the hash holding the monthly mean for every year of the data set
      # for the requested month
      def generate_month_means(measurand)
        means = Hash.new()
        @month_statistic.each_pair { |key, value|
          mean = 0
          value.each { |entry|
            mean += entry.send(measurand)
          }
          mean = (mean / value.length).round(3)
          means[key] = mean
        }
        means
      rescue NoMethodError
        raise ArgumentError, "Error: Given measurand #{measurand} does not exist for this data.".red
      end

    end

  end

end
