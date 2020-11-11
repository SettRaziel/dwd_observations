# @Author: Benjamin Held
# @Date:   2018-06-02 13:02:30
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-11 19:34:35

module DwdObservations

  class Wind < Data

    # @return [Float] the wind speed in [m/s]
    attr_accessor :speed
    # @return [Integer] the wind direction in [degree]
    attr_accessor :direction

  end

end
