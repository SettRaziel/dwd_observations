module DwdObservations

  # Simple data class representing sun duration data
  class Suntime < Data

    # @return [Float] the sunshine duration in minutes per hour
    attr_accessor :sun_duration

  end

end
