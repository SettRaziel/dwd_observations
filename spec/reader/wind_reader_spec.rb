require "time"
require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::WindReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and stores them in the data repository" do
        reader = DwdObservations::WindReader.new(
                 File.join(__dir__,"../files/wind_hourly_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        wind = reader.data_repository.repository[26]
        expect(wind.station_id).to eq(433)  
        expect(wind.timestamp).to eq(Time.parse("2020100314"))
        expect(wind.quality_level).to eq(1)
        expect(wind.speed).to eq(5.7)
        expect(wind.direction).to eq(110)
      end
    end
  end

end
