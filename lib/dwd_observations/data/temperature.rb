# @Author: Benjamin Held
# @Date:   2018-05-11 20:57:27
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-08 21:20:16

module DwdObservations

  class Temperature < Data

    # @return [Float] the station temperature in degree celsius
    attr_accessor :temperature
    # @return [Float] the relative humidity of the station
    attr_accessor :humidity

  end    

end
