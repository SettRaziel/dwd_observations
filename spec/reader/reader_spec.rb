require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::Reader do

  describe "#determine_reader_for" do
    context "given input data and a measurand precipitation" do
      it "reads the data and for the given measurand" do
        reader = DwdObservations::Reader.determine_reader_for("precipitation",
                                File.join(__dir__,"../files/precip_hourly_00433.txt"),
                                File.join(__dir__,"../files/meta_data_00433.txt"))
        expect(reader).to be_a_kind_of(DwdObservations::PrecipitationReader) 
      end
    end
  end

  describe "#determine_reader_for" do
    context "given input data and a measurand pressure" do
      it "reads the data and for the given measurand" do
        reader = DwdObservations::Reader.determine_reader_for("pressure",
                                File.join(__dir__,"../files/pressure_hourly_00433.txt"),
                                File.join(__dir__,"../files/meta_data_00433.txt"))
        expect(reader).to be_a_kind_of(DwdObservations::PressureReader) 
      end
    end
  end

  describe "#determine_reader_for" do
    context "given input data and a measurand suntime" do
      it "reads the data and for the given measurand" do
        reader = DwdObservations::Reader.determine_reader_for("suntime",
                                File.join(__dir__,"../files/suntime_hourly_00433.txt"),
                                File.join(__dir__,"../files/meta_data_00433.txt"))
        expect(reader).to be_a_kind_of(DwdObservations::SuntimeReader) 
      end
    end
  end

  describe "#determine_reader_for" do
    context "given input data and a measurand temperature" do
      it "reads the data and for the given measurand" do
        reader = DwdObservations::Reader.determine_reader_for("temperature",
                                File.join(__dir__,"../files/temp_hourly_00433.txt"),
                                File.join(__dir__,"../files/meta_data_00433.txt"))
        expect(reader).to be_a_kind_of(DwdObservations::TemperatureReader) 
      end
    end
  end

  describe "#determine_reader_for" do
    context "given input data and a measurand wind" do
      it "reads the data and for the given measurand" do
        reader = DwdObservations::Reader.determine_reader_for("wind",
                                File.join(__dir__,"../files/wind_hourly_00433.txt"),
                                File.join(__dir__,"../files/meta_data_00433.txt"))
        expect(reader).to be_a_kind_of(DwdObservations::WindReader) 
      end
    end
  end

  describe "#determine_reader_for" do
    context "given input data and an invalid measurand" do
      it "reads the measurand and returns an error" do
        expect {
          DwdObservations::Reader.determine_reader_for("for",
                                File.join(__dir__,"../files/wind_hourly_00433.txt"),
                                File.join(__dir__,"../files/meta_data_00433.txt"))
        }.to raise_error(ArgumentError)
      end
    end
  end  

end
