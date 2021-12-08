module DwdObservations

  module Parameter

    # class to seperate the storage of the parameter in a repository entity and
    # checking for valid parameter combination as part of the application logic.
    class ParameterHandler < RubyUtils::Parameter::BaseParameterHandler

      # method to initialize the correct repository that should be used 
      # in this handler
      # @param [Array] argv array of input parameters
      def initialize_repository(argv)
        @repository = DwdObservations::Parameter::ParameterRepository.new(argv)
      end

      private

      # private method with calls of the different validations methods
      def validate_parameters
        # none at the moment
      end

      # private method to the specified parameter constraints
      def check_parameter_constraints
        # check mandatory measurand parameter
        check_mandatory_parameter(:measurand)

        # check mandatory file parameter
        check_mandatory_parameter(:file)
      end

    end

  end

end
