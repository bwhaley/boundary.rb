module Boundary
  class MeterManager
    def initialize(auth)
      @url = Boundary.api_url(auth)+'/meters'
      @auth = auth
    end
    
    # List all meters
    def list
      Boundary.get(@url)
    end

    # Find meter by name
    def find_meter(name)
      Boundary.get(@url+"?name=#{name}")
    end

    # Delete meter by name
    def delete(name)
      meter = self.find_meter(name)
      meter.empty? ? nil : Boundary.delete(@url+"/#{meter.first['id']}")
    end
  end
end

