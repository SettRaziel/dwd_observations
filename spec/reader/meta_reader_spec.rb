require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::MetaReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the meta data and creates the meta data" do
        meta_reader = DwdObservations::MetaReader.new(META_DATA.to_path, "Measurand")
        meta_data = meta_reader.meta_data
        expect(meta_data.station.descriptor).to eq(433)
      end
    end
  end

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the meta data and creates the meta data" do
        meta_reader = DwdObservations::MetaReader.new(META_DATA.to_path, "Measurand")
        meta_data = meta_reader.meta_data
        expect(meta_data.station.name).to eq("Berlin-Tempelhof")
      end
    end
  end

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the meta data and creates the meta data" do
        meta_reader = DwdObservations::MetaReader.new(META_DATA.to_path, "Measurand")
        meta_data = meta_reader.meta_data
        expect(meta_data.start_date).to eq(Time.parse("19280101"))
      end
    end
  end

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the meta data and creates the meta data" do
        meta_reader = DwdObservations::MetaReader.new(META_DATA.to_path, "Measurand")
        meta_data = meta_reader.meta_data
        expect(meta_data.measurand).to eq("Measurand")
      end
    end
  end

end
