# DWD Oberservation data
[![Ruby](https://github.com/SettRaziel/dwd_observations/actions/workflows/ruby.yml/badge.svg)](https://github.com/SettRaziel/dwd_observations/actions/workflows/ruby.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/4f124ac156438083ae21/maintainability)](https://codeclimate.com/github/SettRaziel/dwd_observations/maintainability)

This project holds a collection of ruby files that serves as an object mapper for the observation
data from the german weather service (DWD). This repository will provide classes to represent the
observation data for the measurands of the data available through the open data campaign of
the german weather service.

Current version: v0.1.0

## Usage & Help
```
script usage: ruby <script> [parameters] <filename>
help usage :              ruby <script> (-h | --help)
help usage for parameter: ruby <script> <parameter> (-h | --help)
DWD observations help:
 -h, --help      show help text
 -v, --version   prints the current version of the project
 -f, --file      argument: <file>; optional parameter that indicates a filepath to a readable file
 -j, --json      exports the observation values as a json object
 -m, --measurand argument: <measurand>; specifies the considered measurand value
```
Mandatory parameters are:
* file: The file parameter holds the path to the required input file
* measurand: To determine the correct measurand, this parameter needs to be set

## Documentation
The documentation will be created with yard and published at a later point.
It can be generated manually by running the included shell script.

## Used version
Written with Ruby 2.7.0

## Tested
* Linux: running on ArchLinux with Ruby > 2.7.0
* Windows: not tested
* MAC: not tested

## Requirements
* Ruby with a version >= 2.7.0
* Yard (for Documentation only)

## License
The scripts are licensed under the given license file. 3rd party software, scripts
or data are marked and can have different license conditions. 
Please check the folders for subsidiary license files.

The observation data from the german weather service is proteced. They can be used
following the conditions found [here](https://opendata.dwd.de/climate_environment/CDC/Nutzungsbedingungen_German.pdf) 
(last checked: 2020-11-29). The test data of the project (found in [spec/files](./spec/files)) 
uses a subsets of the observation data from the the german weather service. These data
is used to validate the correct function of the code base.

## Roadmap
* parsing scripts to read the data files and extract the necessary informations (done)
* starting script to calculate plots for a given input file
* statistic evaluations for the read observation data
* visualization of the results using additional tools like gnuplot or R

created by: Benjamin Held, November 2020
