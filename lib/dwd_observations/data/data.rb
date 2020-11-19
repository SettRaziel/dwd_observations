# @Author: Benjamin Held
# @Date:   2018-01-12 21:21:39
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-19 19:49:22

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
