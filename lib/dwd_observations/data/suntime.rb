# @Author: Benjamin Held
# @Date:   2018-05-13 17:50:51
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-13 22:03:57

module DwdObservations

  # Simple data class representing sun duration data
  class Suntime < Data

    # @return [Float] the sunshine duration in minutes per hour
    attr_accessor :sun_duration

  end

end
