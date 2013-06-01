module Boundary
  class MeterManager

    def initialize(auth)
      @url = Boundary.api_url(auth)+'/meters'
    end
    
    def list
      Boundary.get(@url)
    end

    # Find meter by name
    def search(name)
      Boundary.get(@url+"?name=#{name}")
    end

    # Delete meter by name or ID
    def delete(name)
      meter_id = self.search(name).first['id']
      Boundary.delete(@url+"/#{meter_id}")
    end
  end
end

