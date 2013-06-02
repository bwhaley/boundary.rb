module Boundary
  class Search
    def initialize(auth)
      @url = Boundary.api_url(auth)+'/search'
    end
  
    def search(q)
      results = Array.new
      results = Boundary.get(@url+"?q=#{q}")
      return nil if results.empty? 
      case results['header']['hits'].to_i
      when 0
        return nil
      else
        return results['entities']
      end
    end
  end
end

