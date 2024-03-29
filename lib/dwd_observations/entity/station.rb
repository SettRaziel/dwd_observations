module DwdObservations

  module Entity

    # Simple data class to represent a station entity
    class Station

      # @return [String] the name of the station
      attr_reader :name
      # @return [String] the description of the station
      attr_reader :descriptor
      # @return [Number] the elevation of the station
      attr_reader :elevation
      # @return [Coordinate] the geo coordinates of the station
      attr_reader :coordinate

      # initialization
      # @param [String] name the name of the station
      # @param [String] descriptor the description of the station
      # @param [Number] elevation the elevation of the station
      # @param [Coordinate] geo_coordinate the geo coordinates of the station
      def initialize(name, descriptor, elevation, geo_coordinate)
        @name = name
        @descriptor = descriptor
        @elevation = elevation
        @coordinate = geo_coordinate
      end

    end

  end

end