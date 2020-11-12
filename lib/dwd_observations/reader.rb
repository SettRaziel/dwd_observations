#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-08 20:30:43
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-12 20:29:16

module DwdObservations

  require "dwd_observations/reader/meta_reader"
  require "dwd_observations/reader/data_reader"
  require "dwd_observations/reader/precipitation_reader"
  require "dwd_observations/reader/pressure_reader"
  require "dwd_observations/reader/suntime_reader"
  require "dwd_observations/reader/temperature_reader"
  require "dwd_observations/reader/wind_reader"

end
