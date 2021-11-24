require "time"
require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::TemperatureReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and stores them in the data repository" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/temp_hourly_00433.txt"), META_DATA.to_path)
        temperature = reader.data_repository.repository[26]
        expect(temperature.station_id).to eq(433)  
        expect(temperature.timestamp).to eq(Time.parse("2020100314"))
        expect(temperature.quality_level).to eq(1)
        expect(temperature.temperature).to eq(21.6)
        expect(temperature.humidity).to eq(59.0)
      end
    end
  end

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and stores the correct time period for the data" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/temp_hourly_00433.txt"), META_DATA.to_path)
        expect(reader.time_period.start_time).to eq(Time.parse("2020100212")) 
        expect(reader.time_period.end_time).to eq(Time.parse("2020100423")) 
      end
    end
  end

end
