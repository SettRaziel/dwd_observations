module DwdObservations

  # Simple data class representing precipitation data
  class Precipitation < Data

    # @return [Float] the amount of precipitation in [mm/h]
    attr_accessor :amount
    # @return [Integer] an indicator number to show if the precipitation
    # result from rain
    attr_accessor :rain_indicator
    # @return [Integer] an indicator number to show the kind of
    # precipitation
    attr_accessor :precipitation_form

  end

end
