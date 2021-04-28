module DwdObservations

  # Simple data class holding the common attributes of the observation data
  class Data

    # @return [Integer] the station id
    attr_accessor :station_id
    # @return [Time] the given timestamp
    attr_accessor :timestamp
    # @return [Integer] the given quality level
    attr_accessor :quality_level
    
  end

end
