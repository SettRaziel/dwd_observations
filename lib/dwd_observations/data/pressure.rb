# @Author: Benjamin Held
# @Date:   2018-06-02 12:58:49
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-10 21:28:39

module DwdObservations

  class Pressure < Data

    # @return [Float] the reduced pressure on sea level
    attr_accessor :reduced_pressure
    # @return [Float] the pressure at the given station
    attr_accessor :station_pressure

  end

end
