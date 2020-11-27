#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-26 20:28:13
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-26 20:34:21

require "time"
require "spec_helper"
require "dwd_observations/reader"
require "dwd_observations/statistic"

describe DwdObservations::Statistic::Year do

  describe ".create_year_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and calculates the annual means" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Year.new(reader.data_repository)
        means = statistic.create_year_statistic_for(:temperature)
        expect(means[2014]).to eq(18.083)
        expect(means[2019]).to eq(28.55)
      end
    end
  end

  describe ".create_year_statistic_for" do
    context "given a text file with oberservated humidity data" do
      it "reads the data and calculates the annual means" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Year.new(reader.data_repository)
        means = statistic.create_year_statistic_for(:humidity)
        expect(means[2014]).to eq(73.0)
        expect(means[2019]).to eq(26.333)
      end
    end
  end

  describe ".create_year_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and calculates the annual means" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Year.new(reader.data_repository)
        means = statistic.create_year_statistic_for(:temperature)
        expect(means.keys.length).to eq(6)
      end
    end
  end

  describe ".create_year_statistic_for" do
    context "given a text file with oberservated pressure data" do
      it "reads the data and calculates the annual means" do
        reader = DwdObservations::PressureReader.new(
                 File.join(__dir__,"../files/pressure_hourly_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Year.new(reader.data_repository)
        means = statistic.create_year_statistic_for(:station_pressure)
        expect(means.keys.length).to eq(1)
        expect(means[2020]).to eq(991.73)
      end
    end
  end

  describe ".create_year_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and query the wrong measurand for the data" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Year.new(reader.data_repository)
        expect{
          statistic.create_year_statistic_for(:foo)
         }.to raise_error(ArgumentError)
      end
    end
  end

end
