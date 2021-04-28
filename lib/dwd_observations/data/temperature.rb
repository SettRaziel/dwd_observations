module DwdObservations

  # Simple data class representing temperature data
  class Temperature < Data

    # @return [Float] the station temperature in degree celsius
    attr_accessor :temperature
    # @return [Float] the relative humidity of the station
    attr_accessor :humidity

  end    

end
