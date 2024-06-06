# frozen_string_literal: true

require_relative "freight_calc/version"

module FreightCalc
  class Error < StandardError; end

  require 'json'
  require 'net/http'

  class DistCalculator
    def initialize(weight, length, width, height, origin, destination)
      @weight = weight
      @length = length
      @width = width
      @height = height
      @origin = origin
      @destination = destination
    end

    def calculate_distance
      url = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{@origin}&destinations=#{@destination}&key=#{ENV.fetch("DISTANCE_API_KEY")}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)

      unless data && data['rows'] && data['rows'][0] && data['rows'][0]['elements'] && data['rows'][0]['elements'][0] && data['rows'][0]['elements'][0]['distance'] && data['rows'][0]['elements'][0]['distance']['value']
        return nil
      end

      data['rows'][0]['elements'][0]['distance']['value']

      # Handle the case when the data is not in the expected format
    end

    def calculate_price
      distance = calculate_distance
      volume = @length * @width * @height / 1_000_000.0 # convert cm^3 to m^3

      price = if volume < 1
                distance * 1
              elsif volume >= 1 && @weight <= 10
                distance * 2
              else
                distance * 3
              end

      { weight: @weight, length: @length, width: @width, height: @height, distance: distance, price: price }
    end
  end
end
