#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-12-04 19:39:07
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-12-04 19:41:43

module DwdObservations

  # Parent module which holds the classes dealing with reading and validating
  # the provided input parameters
  module Parameter

    # Parameter repository to store the valid parameters of the script.
    # {#initialize} gets the provided parameters and fills a hash which
    # grants access to the provided parameters and arguments.
    class ParameterRepository < RubyUtils::Parameter::BaseParameterRepository

      private

      # method to read further argument and process it depending on its content
      # @param [String] arg the given argument
      # @param [Array] unflagged_arguments the argument array
      def process_argument(arg)
        case arg
          when *@mapping[:measurand]       then create_argument_entry(:measurand)
          when /-[a-z]|--[a-z]+/ then raise_invalid_parameter(arg)
        else
          raise_invalid_parameter(arg)
        end
        nil
      end

      # method to define the input string values that will match a given paramter symbol
      def define_mapping
        @mapping[:measurand] = ['-m', '--measurand']
      end

    end

  end

end
