#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-27 22:10:13
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-27 22:28:36

require "time"
require "spec_helper"
require "dwd_observations/reader"
require "dwd_observations/statistic"

describe DwdObservations::Statistic::MultiYear do

  describe ".create_multi_year_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and calculates the annual means" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::MultiYear.new(reader.data_repository)
        mean = statistic.create_multi_year_statistic_for(:temperature, 2014, 5)
        expect(mean).to eq(23.143)
      end
    end
  end

  describe ".create_multi_year_statistic_for" do
    context "given a text file with oberservated humidity data" do
      it "reads the data and calculates the annual means" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::MultiYear.new(reader.data_repository)
        mean = statistic.create_multi_year_statistic_for(:humidity, 2014, 5)
        expect(mean).to eq(57.767)
      end
    end
  end

  describe ".create_multi_year_statistic_for" do
    context "given a text file with oberservated pressure data" do
      it "reads the data and calculates the annual means" do
        reader = DwdObservations::PressureReader.new(
                 File.join(__dir__,"../files/pressure_hourly_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::MultiYear.new(reader.data_repository)
        mean = statistic.create_multi_year_statistic_for(:station_pressure, 2020, 1)
        expect(mean).to eq(991.73)
      end
    end
  end

  describe ".create_multi_year_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and query the wrong measurand for the data" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::MultiYear.new(reader.data_repository)
        expect{
          statistic.create_multi_year_statistic_for(:foo)
         }.to raise_error(ArgumentError)
      end
    end
  end

end
