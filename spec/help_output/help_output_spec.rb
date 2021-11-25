require "spec_helper"
require "dwd_observations/help/help_output"

describe DwdObservations::HelpOutput do

  describe "#print_help_for" do
    context "given a one element help entry" do
      it "print the help text for :measurand" do
        expect { 
          DwdObservations::HelpOutput.print_help_for(:measurand) 
        }.to output("DWD observations help:".light_yellow + "\n" + \
                    " -m, --measurand ".light_blue + "argument:".red + " <measurand>".yellow  + \
                    "; specifies the considered measurand value\n").to_stdout
      end
    end
  end

  describe "#print_help_for" do
    context "given a one element help entry" do
      it "print the help text for :json" do
        expect { 
          DwdObservations::HelpOutput.print_help_for(:json) 
        }.to output("DWD observations help:".light_yellow + "\n" + \
                    " -j, --json      ".light_blue +  \
                    "exports the observation values as a json object\n").to_stdout
      end
    end
  end

  describe "#print_help_for" do
    context "given a to whole help text" do
      it "print the help text for the script" do
        expect { 
          DwdObservations::HelpOutput.print_help_for(true)
        }.to output("script usage:".red + " ruby <script> [parameters] <filename>\n" + \
                    "help usage :".green + "              ruby <script> (-h | --help)\n" + \
                    "help usage for parameter:".green + " ruby <script> <parameter> (-h | --help)\n" + \
                    "DWD observations help:".light_yellow + "\n" + \
                    " -h, --help      ".light_blue + "show help text\n" + \
                    " -v, --version   ".light_blue + "prints the current version of the project\n" + \
                    " -f, --file      ".light_blue + "argument:".red + " <file>".yellow  + \
                    "; optional parameter that indicates a filepath to a readable file\n" + \
                    " -j, --json      ".light_blue + \
                    "exports the observation values as a json object\n" + \
                    " -m, --measurand ".light_blue + "argument:".red + " <measurand>".yellow  + \
                    "; specifies the considered measurand value\n").to_stdout
      end
    end
  end  

end
