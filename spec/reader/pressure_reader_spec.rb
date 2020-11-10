#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-10 21:25:23
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-10 21:29:27

require "time"
require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::PressureReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and stores them in the data repository" do
        reader = DwdObservations::PressureReader.new(
                 File.join(__dir__,"../files/pressure_hourly_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        pressure = reader.data_repository.repository[26]
        expect(pressure.station_id).to eq(433)  
        expect(pressure.timestamp).to eq(Time.parse("2020100314"))
        expect(pressure.quality_level).to eq(1)
        expect(pressure.reduced_pressure).to eq(992.4)
        expect(pressure.station_pressure).to eq(986.8)
      end
    end
  end

end
