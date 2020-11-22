#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-19 19:58:04
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-22 16:17:06

require "time"
require "spec_helper"
require "dwd_observations/reader"
require "dwd_observations/statistic"

describe DwdObservations::Statistic::Month do

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and calculates the monthly means for june" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        means = statistic.create_month_statistic_for(6, :temperature)
        expect(means[2014]).to eq(18.083)
        expect(means[2019]).to eq(28.55)
      end
    end
  end

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and calculates the monthly means for june" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        means = statistic.create_month_statistic_for(6, :temperature)
        expect(means.keys.length).to eq(6)
      end
    end
  end

  describe ".create_month_statistic_for" do
    context "given a text file with oberservated temperature data" do
      it "reads the data and query the wrong measurand for the data" do
        reader = DwdObservations::TemperatureReader.new(
                 File.join(__dir__,"../files/month_temp_00433.txt"),
                 File.join(__dir__,"../files/meta_data_00433.txt"))
        statistic = DwdObservations::Statistic::Month.new(reader.data_repository)
        expect{
          means = statistic.create_month_statistic_for(6, :foo)
         }.to raise_error(ArgumentError)
      end
    end
  end

end
