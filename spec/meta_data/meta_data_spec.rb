require "spec_helper"
require "dwd_observations/meta_data"

describe DwdObservations::MetaData do

  describe ".new" do
    context "given an array with the header information and measurand" do
      it "create meta data and have the correct station id" do
        header = ["   433", "   48.00", " 52.4675", " 13.4021", "20180531", "        "," Berlin-Tempelhof"]
        meta_data = DwdObservations::MetaData.new(header, "Temperature")
        expect(meta_data.station.descriptor).to eq(433)
      end
    end
  end

  describe ".new" do
    context "given an array with the header information and measurand" do
      it "create meta data and have the correct station name" do
        header = ["   433", "   48.00", " 52.4675", " 13.4021", "20180531", "        "," Berlin-Tempelhof"]
        meta_data = DwdObservations::MetaData.new(header, "Temperature")
        expect(meta_data.station.name).to eq("Berlin-Tempelhof")
      end
    end
  end

  describe ".new" do
    context "given an array with the header information and measurand" do
      it "create meta data and have the correct station name" do
        header = ["   433", "   48.00", " 52.4675", " 13.4021", "20180531", "        "," Berlin-Tempelhof"]
        meta_data = DwdObservations::MetaData.new(header, "Temperature")
        expect(meta_data.start_date).to eq(Time.parse("20180531"))
      end
    end
  end

  describe ".new" do
    context "given an array with the header information and measurand" do
      it "create meta data and have the correct measurand" do
        header = ["   433", "   48.00", " 52.4675", " 13.4021", "20180531", "        "," Berlin-Tempelhof"]
        meta_data = DwdObservations::MetaData.new(header, "Temperature")
        expect(meta_data.measurand).to eq("Temperature")
      end
    end
  end

end
