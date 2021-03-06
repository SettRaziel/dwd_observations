require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::MetaReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the meta data and creates the meta data" do
        meta_reader = DwdObservations::MetaReader.new(File.join(__dir__,"../files/meta_data_00433.txt"))
        meta_data = meta_reader.meta_data
        expect(meta_data.station_id).to eq(433)
      end
    end
  end

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the meta data and creates the meta data" do
        meta_reader = DwdObservations::MetaReader.new(File.join(__dir__,"../files/meta_data_00433.txt"))
        meta_data = meta_reader.meta_data
        expect(meta_data.station_name).to eq("Berlin-Tempelhof")
      end
    end
  end

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the meta data and creates the meta data" do
        meta_reader = DwdObservations::MetaReader.new(File.join(__dir__,"../files/meta_data_00433.txt"))
        meta_data = meta_reader.meta_data
        expect(meta_data.start_date).to eq(Time.parse("19470101"))
      end
    end
  end

end
