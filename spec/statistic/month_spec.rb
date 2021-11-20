require "time"
require "spec_helper"
require "dwd_observations/reader"
require "dwd_observations/statistic"

describe DwdObservations::Statistic::Month do

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and calculates the monthly means for june" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"), META_DATA.to_path)
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        means = statistic.create_month_statistic_for(6, :temperature)
        expect(means[2014]).to eq(18.083)
        expect(means[2019]).to eq(28.55)
      end
    end
  end

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated humidity data" do
      it "reads the data and calculates the monthly means for june" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"), META_DATA.to_path)
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        means = statistic.create_month_statistic_for(6, :humidity)
        expect(means[2014]).to eq(73.0)
        expect(means[2019]).to eq(26.333)
      end
    end
  end

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and calculates the monthly means for june" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"), META_DATA.to_path)
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        means = statistic.create_month_statistic_for(6, :temperature)
        expect(means.keys.length).to eq(6)
      end
    end
  end

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated pressure data" do
      it "reads the data and calculates the monthly means for october" do
        reader = DwdObservations::PressureReader.new(
                 File.join(__dir__,"../files/pressure_hourly_00433.txt"), META_DATA.to_path)
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        means = statistic.create_month_statistic_for(10, :station_pressure)
        expect(means.keys.length).to eq(1)
        expect(means[2020]).to eq(991.73)
      end
    end
  end

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated pressure data for october" do
      it "reads the data and get no values for june" do
        reader = DwdObservations::PressureReader.new(
                 File.join(__dir__,"../files/pressure_hourly_00433.txt"), META_DATA.to_path)
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        means = statistic.create_month_statistic_for(6, :station_pressure)
        expect(means.keys.length).to eq(0)
        expect(means[2020]).to be_nil
      end
    end
  end

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and query the wrong measurand for the data" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"), META_DATA.to_path)
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        expect{
          statistic.create_month_statistic_for(6, :foo)
         }.to raise_error(ArgumentError)
      end
    end
  end

end
