require 'json'
require 'rest-client'

module Boundary
  require_relative 'boundary/meter_manager'
  require_relative 'boundary/search'

  def self.api_url(auth)
    "https://#{auth[:key]}:@api.boundary.com/#{auth[:org]}"
  end

  # Create methods for calling the API
  %w(get delete).each do |meth|
    define_method meth do |url|
      RestClient.send(meth, url) { |response, request, result| 
        case response.code.to_s
        when /200/
          JSON.parse(response) 
        when /204/
          response
        else
          raise "Error #{response.code} from Boundary API."
        end
      }
    end
  end
  
  extend self
end

