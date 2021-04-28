module DwdObservations

  # Simple data class representing wind data
  class Wind < Data

    # @return [Float] the wind speed in [m/s]
    attr_accessor :speed
    # @return [Integer] the wind direction in [degree]
    attr_accessor :direction

  end

end
