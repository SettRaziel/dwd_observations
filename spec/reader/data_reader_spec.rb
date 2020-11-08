#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-08 19:35:29
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-08 20:01:11

require "spec_helper"
require "dwd_observations/reader/data_reader"

describe DwdObservations::DataReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and fails with an error for the abstract method" do
        expect { 
          DwdObservations::DataReader.new(File.join(__dir__,"../files/temp_hourly_00433.txt"))
        }.to raise_error(NotImplementedError)
      end
    end
  end

end
