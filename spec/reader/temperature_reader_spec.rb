#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-08 20:58:10
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-08 21:12:50

require "time"
require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::TemperatureReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and stores them in the data repository" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/temp_hourly_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        temperature = reader.data_repository.repository[26]
        expect(temperature.station_id).to eq(433)  
        expect(temperature.timestamp).to eq(Time.parse("2020100314"))
        expect(temperature.quality_level).to eq(1)
        expect(temperature.temperature).to eq(21.6)
        expect(temperature.humidity).to eq(59.0)
      end
    end
  end

end
