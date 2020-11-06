# DWD Oberservation data

This project holds a collection of ruby files that serves as an object mapper for the observation
data from the german weather service (DWD). This repository will provide classes to represent the
observation data for the measurands of the data available through the open data campaign of
the german weather service.

Current version: v0.0.1

## Usage & Help
```
usage: follows
```

## Documentation
The documentation will be created with yard and published at a later point.

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

The oberservation data from the german weather service is proteced. They can be used
following the conditions found [here](https://opendata.dwd.de/climate_environment/CDC/Nutzungsbedingungen_German.pdf).

## Roadmap
* parsing scripts to read the data files and extract the necessary informations
* starting script to calculate plots for a given input file
* statistic evaluations for the read observation data
* visualization of the results using additional tools like gnuplot or R

created by: Benjamin Held, November 2020
