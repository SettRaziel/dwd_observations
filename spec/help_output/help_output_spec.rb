#!/usr/bin/ruby
# @Author: Benjamin Held
# @Date:   2020-03-16 20:59:23
# @Last Modified by:   Benjamin Held
# @Last Modified time: 2021-02-02 18:39:05

require "spec_helper"
require "dwd_observations/help/help_output"

describe DwdObservations::HelpOutput do

  describe "#print_help_for" do
    context "given a one element help entry" do
      it "print the help text for :measurand" do
        expect { 
          DwdObservations::HelpOutput.print_help_for(:measurand) 
        }.to output("DWD observations help:".light_yellow + "\n" + \
                    " -m, --measurand".light_blue + "argument:".red + " <measurand>".yellow  + \
                    "; specifies the considered measurand value\n").to_stdout
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
                    " -h, --help     ".light_blue + "show help text\n" + \
                    " -v, --version  ".light_blue + "prints the current version of the project\n" + \
                    " -m, --measurand".light_blue + "argument:".red + " <measurand>".yellow  + \
                    "; specifies the considered measurand value\n").to_stdout
      end
    end
  end  

end
