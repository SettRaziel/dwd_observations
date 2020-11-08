# @Author: Benjamin Held
# @Date:   2018-01-12 21:21:39
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-08 21:05:13

module DwdObservations

  # Simple data class holding the common attributes of the observation data
  class Data

    # the station id
    attr_accessor :station_id
    # the given timestamp
    attr_accessor :timestamp
    # the given quality level
    attr_accessor :quality_level
    
  end

end
