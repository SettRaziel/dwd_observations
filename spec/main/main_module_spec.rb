require "spec_helper"
require "dwd_observations"

describe DwdObservations do

  describe "#print_help" do
    context "given only the help parameter as an argument" do
      it "initialize application correctly and print help text" do
        expect { 
          arguments = ["--help"]
          DwdObservations.initialize(arguments)
          DwdObservations.print_help
        }.to output("script usage:".red + " ruby <script> [parameters] <filename>\n" + \
                    "help usage :".green + "              ruby <script> (-h | --help)\n" + \
                    "help usage for parameter:".green + " ruby <script> <parameter> (-h | --help)\n" + \
                    "DWD observations help:".light_yellow + "\n" + \
                    " -h, --help      ".light_blue + "show help text\n" + \
                    " -v, --version   ".light_blue + "prints the current version of the project\n" + \
                    " -f, --file      ".light_blue + "argument:".red + " <file>".yellow  + \
                    "; optional parameter that indicates a filepath to a readable file\n" + \
                    " -m, --measurand ".light_blue + "argument:".red + " <measurand>".yellow  + \
                    "; specifies the considered measurand value\n").to_stdout
      end
    end
  end

  describe "#print_help_for" do
    context "given an array of parameters without help parameter" do
      it "print the error" do
        expect { 
          arguments = ["-m", "-h", File.join(__dir__,"../files/wind_hourly_00433.txt")]
          DwdObservations.initialize(arguments)
          DwdObservations.print_help
        }.to output("DWD observations help:".light_yellow + "\n" + \
                    " -m, --measurand ".light_blue + "argument:".red + " <measurand>".yellow  + \
                    "; specifies the considered measurand value\n").to_stdout
      end
    end
  end

  describe "#print_version" do
    context "given the module" do
      it "print the version text" do
        expect {
          arguments = ["--version"]
          DwdObservations.initialize(arguments)
          DwdObservations.print_version
        }.to output("dwd_observations version 0.0.1".yellow + "\n" + \
                    "Created by Benjamin Held (November 2020)".yellow + "\n").to_stdout
      end
    end
  end

end
