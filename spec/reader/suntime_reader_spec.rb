require "time"
require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::SuntimeReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and stores them in the data repository" do
        reader = DwdObservations::SuntimeReader.new(
                 File.join(__dir__,"../files/suntime_hourly_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        suntime = reader.data_repository.repository[26]
        expect(suntime.station_id).to eq(433)  
        expect(suntime.timestamp).to eq(Time.parse("2020100314"))
        expect(suntime.quality_level).to eq(1)
        expect(suntime.sun_duration).to eq(56.0)
      end
    end
  end

end
