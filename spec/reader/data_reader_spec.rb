require "spec_helper"
require "dwd_observations/reader"

describe DwdObservations::DataReader do

  describe ".new" do
    context "given a text file with oberservation data" do
      it "reads the data and fails with an error for the abstract method" do
        expect { 
          DwdObservations::DataReader.new(File.join(__dir__,"../files/temp_hourly_00433.txt"),
                                          META_DATA.to_path, "Measurand")
        }.to raise_error(NotImplementedError)
      end
    end
  end

end
