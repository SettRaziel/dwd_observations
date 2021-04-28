module DwdObservations

  # Simple data class representing pressure data
  class Pressure < Data

    # @return [Float] the reduced pressure on sea level
    attr_accessor :reduced_pressure
    # @return [Float] the pressure at the given station
    attr_accessor :station_pressure

  end

end
