# @Author: Benjamin Held
# @Date:   2018-05-11 20:57:27
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-13 22:04:09

module DwdObservations

  # Simple data class representing temperature data
  class Temperature < Data

    # @return [Float] the station temperature in degree celsius
    attr_accessor :temperature
    # @return [Float] the relative humidity of the station
    attr_accessor :humidity

  end    

end
