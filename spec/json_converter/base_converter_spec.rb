require "spec_helper"
require "dwd_observations/json_converter"
require "dwd_observations/reader"

describe DwdObservations::JsonConverter::BaseConverter do


  describe ".generate_data_values" do
    context "given a meteogram output file" do
      it "initialize converter and fail when calling abstract method" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/temp_hourly_00433.txt"), META_DATA.to_path)
        converter = DwdObservations::JsonConverter::BaseConverter.new(reader.data_repository)
        expect { 
          converter.send(:generate_data_values)
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe ".convert" do
    context "given a meteogram output file inside convert" do
      it "initialize converter and fail when calling abstract method inside convert" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/temp_hourly_00433.txt"), META_DATA.to_path)
        converter = DwdObservations::JsonConverter::BaseConverter.new(reader.data_repository)
        expect { 
          converter.convert(".")
        }.to raise_error(NotImplementedError)
      end
    end
  end

  describe ".convert" do
    context "given a meteogram output file" do
      it "initialize converter and fail when calling abstract method inside convert" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/temp_hourly_00433.txt"), META_DATA.to_path)
        converter = DwdObservations::JsonConverter::BaseConverter.new(reader.data_repository)
        expect { 
          converter.convert()
        }.to raise_error(NotImplementedError)
      end
    end
  end

end
