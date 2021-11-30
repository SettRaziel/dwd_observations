require "spec_helper"
require "dwd_observations/json_converter"
require "dwd_observations/reader"

describe DwdObservations::JsonConverter::MeasurandConverter do

  describe ".convert" do
    context "given temperature observation data of a station" do
      it "initialize converter and and create json output for the temperature" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(DATA_ROOT,"temp_hourly_00433.txt"), META_DATA.to_path)
        converter = DwdObservations::JsonConverter::MeasurandConverter.new(reader.data_repository)
        converter.convert(DATA_ROOT.to_path)
        expect(FileUtils.compare_file(File.join(DATA_ROOT,"output.json"), File.join(DATA_ROOT,"temperature_output.json"))).to be_truthy

        # clean up data from the test and catch errors since they should not let the test fail
        File.delete(File.join(DATA_ROOT,"output.json"))
      end
    end
  end

  describe ".convert" do
    context "given pressure observation data of a station" do
      it "initialize converter and and create json output for the pressure" do
        reader = DwdObservations::PressureReader.new(
                 File.join(DATA_ROOT,"pressure_hourly_00433.txt"), META_DATA.to_path)
        converter = DwdObservations::JsonConverter::MeasurandConverter.new(reader.data_repository)
        converter.convert(DATA_ROOT.to_path)
        expect(FileUtils.compare_file(File.join(DATA_ROOT,"output.json"), File.join(DATA_ROOT,"pressure_output.json"))).to be_truthy

        # clean up data from the test and catch errors since they should not let the test fail
        File.delete(File.join(DATA_ROOT,"output.json"))
      end
    end
  end

  describe ".convert" do
    context "given precipitation observation data of a station" do
      it "initialize converter and and create json output for the precipitation" do
        reader = DwdObservations::PrecipitationReader.new(
                 File.join(DATA_ROOT,"precip_hourly_00433.txt"), META_DATA.to_path)
        converter = DwdObservations::JsonConverter::MeasurandConverter.new(reader.data_repository)
        converter.convert(DATA_ROOT.to_path)
        expect(FileUtils.compare_file(File.join(DATA_ROOT,"output.json"), File.join(DATA_ROOT,"precip_output.json"))).to be_truthy

        # clean up data from the test and catch errors since they should not let the test fail
        File.delete(File.join(DATA_ROOT,"output.json"))
      end
    end
  end

  describe ".convert" do
    context "given wind observation data of a station" do
      it "initialize converter and and create json output for the wind" do
        reader = DwdObservations::WindReader.new(
                 File.join(DATA_ROOT,"wind_hourly_00433.txt"), META_DATA.to_path)
        converter = DwdObservations::JsonConverter::MeasurandConverter.new(reader.data_repository)
        converter.convert(DATA_ROOT.to_path)
        expect(FileUtils.compare_file(File.join(DATA_ROOT,"output.json"), File.join(DATA_ROOT,"wind_output.json"))).to be_truthy

        # clean up data from the test and catch errors since they should not let the test fail
        File.delete(File.join(DATA_ROOT,"output.json"))
      end
    end
  end

end
