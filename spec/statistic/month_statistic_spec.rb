#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-19 19:58:04
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-22 15:51:55

require "time"
require "spec_helper"
require "dwd_observations/reader"
require "dwd_observations/statistic"

describe DwdObservations::Statistic::Month do

  describe ".new" do
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

end
