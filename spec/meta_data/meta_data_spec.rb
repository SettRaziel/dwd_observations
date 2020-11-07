#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-11-07 18:36:52
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2020-11-07 19:09:49

require "spec_helper"
require "dwd_observations/meta_data"

describe DwdObservations::MetaData do

  describe ".new" do
    context "given an array with the header information" do
      it "create meta data and have the correct station id" do
        header = ["   2014","Hannover                                ","18560101"]
        meta_data = DwdObservations::MetaData.new(header)
        expect(meta_data.station_id).to eq(2014)
      end
    end
  end

  describe ".new" do
    context "given an array with the header information" do
      it "create meta data and have the correct station name" do
        header = ["   2014","Hannover                                ","18560101"]
        meta_data = DwdObservations::MetaData.new(header)
        expect(meta_data.station_name).to eq("Hannover")
      end
    end
  end

  describe ".new" do
    context "given an array with the header information" do
      it "create meta data and have the correct station name" do
        header = ["   2014","Hannover                                ","18560101"]
        meta_data = DwdObservations::MetaData.new(header)
        expect(meta_data.start_date).to eq(Time.parse("18560101"))
      end
    end
  end

end
