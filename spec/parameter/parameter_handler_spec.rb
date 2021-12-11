require "spec_helper"
require "dwd_observations/parameter"

describe DwdObservations::Parameter::ParameterHandler do

  describe ".new" do
    context "given the measurand flag" do
      it "create the repository and pass the parameter contrains" do
        arguments = ["-m", "temperature", "--file", "filename"]
        parameter_handler = DwdObservations::Parameter::ParameterHandler.new(arguments)
        expect(parameter_handler.repository.parameters[:measurand]).to eq("temperature")
      end
    end
  end

  describe ".new" do
    context "given only the file flag" do
      it "create the repository and fail the parameter contrains due to missing measurand" do
        arguments = ["-f", "filename"]
        expect {
          DwdObservations::Parameter::ParameterHandler.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given the measurand flag" do
      it "create the repository and fail the parameter contrains due to missing file" do
        arguments = ["-m", "temperature"]
        expect {
          DwdObservations::Parameter::ParameterHandler.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

end
