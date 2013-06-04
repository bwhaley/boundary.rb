require 'json'
require 'rest-client'

module Boundary
  class Search
    def initialize(auth)
      @url = Boundary.api_url(auth)+'/searches'
      @auth = auth
    end

    # List existing saved searches
    def searches
      Boundary.get(@url)
    end

    # Create new saved search/dynamic group
    # name (String) is self explanatory
    # q (String) is a Boundary dynamic group valid query string
    #  Valid query parameters are
    #  name, tag, meter_version, export_address, nic_ip, nic_mac, os_distribution_name,
    #  os_machine, os_nodename, os_release, os_sysname, os_version
    #  These should be separated by AND/OR and can be group with parenthesis
    #  Example: q='(name:*web* AND tag:*us-west-2*) OR (name:*db* AND nic_ip:*10.0.0.10*)'
    #  NOTE: This method does not sanity check the query string!
    # type (String) Meter or Annotation
    def create(name, q, type='meter')
      raise "Save search type must be meter or annotation." unless ['meter','annotation'].include?(type) 
      ss = Hash.new
      ss[:name] = name
      ss[:q] = q
      ss[:types] = type
      response = Boundary.post(@url, JSON.generate(ss), {:content_type => :json, :accept => :json})
      response['id']
    end

    # Search for a meter (solr syntax accepted)
    def search(q)
      url = Boundary.api_url(@auth)+'/search'
      results = Array.new
      results = Boundary.get(url+"?q=#{q}")
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

