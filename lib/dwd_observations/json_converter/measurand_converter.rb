require "ruby_utils/data_repository"
require "ruby_utils/string"

module DwdObservations

  # Module to hold the classes handling the conversion of weather data into a
  # predefined json format.
  module JsonConverter

    # Class for the json converter to convert preread weather observation data
    # into the specified output format. The metadata is identical for all
    # measurands, the weather values can depend on the different attributes.
    class MeasurandConverter

      # initialization
      # @param [DataRepository] repository the prefilled repository
      def initialize(repository)
        @data = repository
      end

      # method to convert the data of repository into the given json output
      # @param [String] filepath the filepath where the output should be created,
      # if nil the output will be printed to stdout
      # @return [String] the json formatted output
      def convert(filepath=nil)
        output = Hash.new()
        output[:meta_data] = generate_meta_hash()
        output[:weather_data] = generate_data_values()

        output_string = JSON.pretty_generate(output)
        if (filepath != nil)
          file = File.open(File.join(filepath,"output.json"), "w")
          file.write(output_string)
          file.close
        end
        return output_string
      end

      private

      # @return [DataRepository] the data repository
      attr_reader :data

      # methode to create the meta entry based on the meta data in the repoitory
      # @return [Hash] the prepared key/value hash of the meta data for the
      # json conversion
      def generate_meta_hash
        meta_hash = Hash.new()
        meta_hash[:station] = generate_station_hash(@data.meta_data.station)
        meta_hash[:start_date] = @data.meta_data.start_date
        meta_hash[:measurand] = @data.meta_data.measurand
        return meta_hash
      end

      # method to create the station entry based on the meta data in the repository
      # @param [Station] station the station data
      # @return [Hash] the prepared key/value hash of the station for the
      # json conversion
      def generate_station_hash(station)
        station_hash = Hash.new()
        station_hash[:name] = station.name
        station_hash[:descriptor] = station.descriptor
        station_hash[:elevation] = station.elevation
        station_hash[:coordinate] = { :x => station.coordinate.x, 
                                      :y => station.coordinate.y }
        return station_hash
      end

      # method which adds the weather data to the weather key that will
      # be converted into json via a Hash. If this method implements faulty
      # Hashes the json conversion will fail.
      # @return [Array] the Array with the observation data hashes
      def generate_data_values
        data_array = Array.new()
        @data.repository.each { |dataset|
          data_array << create_data_hash(dataset)
        }
        return data_array
      end

      # method to create a valid json hash for a given data entry as 
      # pair {instance_variable, value}
      # @param [DwdObservations::Data] dataset the specific child class of data for the measurand
      # @return [Hash] the key-value hashes for the json output     
      def create_data_hash(dataset)
        data_entries = Hash.new()
        dataset.instance_variables.map{ |ivar| 
          data_entries[ivar.to_s.tr("@", "")] = dataset.instance_variable_get(ivar)
        }
        return data_entries
      end

    end

  end

end
