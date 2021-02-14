#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-12-04 19:48:17
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2021-02-14 11:43:06

require "spec_helper"
require "dwd_observations/parameter"

describe DwdObservations::Parameter::ParameterRepository do

  describe ".new" do
    context "given the one element measurand flag" do
      it "create the repository with the correct flags" do
        arguments = ["-m", "temperature", "-f", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:measurand]).to eq("temperature")
      end
    end
  end

  describe ".new" do
    context "given the one element measurand flag" do
      it "create the repository with the correct flags" do
        arguments = ["--measurand", "pressure", "--file", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:measurand]).to eq("pressure")
      end
    end
  end

  describe ".new" do
    context "given only the filename" do
      it "create the repository with the correct filename" do
        arguments = ["-f", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:file]).to eq("filename")
      end
    end
  end

  describe ".new" do
    context "given only the filename" do
      it "create the repository with the correct filename" do
        arguments = ["filename"]
        expect {
          DwdObservations::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given no arguments for the initialization" do
      it "raise an argument error" do
        arguments = [ ]
        expect { 
          DwdObservations::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given an invalid parameter" do
      it "raise an argument error" do
        arguments = ["test", "--file", "filename"]
        expect { 
          DwdObservations::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given an invalid parameter" do
      it "raise an argument error" do
        arguments = ["-1"]
        expect { 
          DwdObservations::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given an invalid parameter" do
      it "raise an argument error" do
        arguments = ["--error", "filename"]
        expect { 
          DwdObservations::Parameter::ParameterRepository.new(arguments)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".new" do
    context "given the version flag as parameter" do
      it "set the flag for version output" do
        arguments = ["-v", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:version]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the version flag as parameter" do
      it "set the flag for version output" do
        arguments = ["--version", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:version]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the help flag as parameter" do
      it "set the flag for help output" do
        arguments = ["-h", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(true)
      end
    end
  end

  describe ".new" do
    context "given the help flag with the date parameter" do
      it "set the flag for help output with the date" do
        arguments = ["-m", "-h", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(:measurand)
      end
    end
  end

  describe ".new" do
    context "given the help flag with the date parameter" do
      it "set the flag for help output with the date" do
        arguments = ["--measurand", "--help", "filename"]
        parameter_repository = DwdObservations::Parameter::ParameterRepository.new(arguments)
        expect(parameter_repository.parameters[:help]).to eq(:measurand)
      end
    end
  end

end
