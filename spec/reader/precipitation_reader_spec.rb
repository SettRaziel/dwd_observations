require "time"
require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::PrecipitationReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and stores them in the data repository" do
        reader = DwdObservations::PrecipitationReader.new(
                 File.join(__dir__,"../files/precip_hourly_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        precipitation = reader.data_repository.repository[8]
        expect(precipitation.station_id).to eq(433)  
        expect(precipitation.timestamp).to eq(Time.parse("2020103008"))
        expect(precipitation.quality_level).to eq(1)
        expect(precipitation.amount).to eq(1.9)
        expect(precipitation.rain_indicator).to eq(1)
        expect(precipitation.precipitation_form).to eq(-999)
      end
    end
  end

end
