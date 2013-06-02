boundary.rb
=======

A ruby library for the [Boundary](http://boundary.com) API.

Currently only meter list, search and delete are supported.

    auth = {}
    auth[:org] = ENV['BOUNDARY_ORG_ID'] 
    auth[:key] = ENV['BOUNDARY_API_KEY']

    meters = Boundary::Search.new(auth)
    meters.search('host*')
    =>
    {
     "id": "8ECrJ6gMcKxTaoNtdA",
     "href"=>
      "https://api.boundary.com/68b42008f6e53fed/meters/8ECrJ6gMcKxTaoNtdA",
     "type"=>"meter",
     "body"=>
      {"os_distribution_name"=>"host",
       "os_machine"=>"x86_64",
       "os_version"=>"#1 SMP Tue Nov 20 10:06:15 UTC 2012",
       "os_release"=>"3.2.34-55.46.amzn1.x86_64",
       "os_nodename"=>"host",
       "os_sysname"=>"Linux",
       "meter_version"=>"1.0.0fi921",
       "export_address"=>"192.168.8.105",
       "connected_at"=>1369254172240,
       "obs_domain_id"=>"736",
       "name"=>"host.example.com",
       "date_minutely"=>"2012-12-04 22:31:00",
       "date_hourly"=>"2012-12-04 22:00:00",
       "date_daily"=>"2012-12-04 00:00:00",
       "date_monthly"=>"2012-12-01 00:00:00",
       ...
    },{
      ...

    meters = Boundary::MeterManager.new(auth)
    meters.list
    => 
    {
      "id": "8ECrJ6gMcKxTaoNtdA",
      "name": "somemeter",
      "obs_domain_id": "1",
      "cert_serial_number": "8ECrJ6gMcKxTaoNtdB",
      "org_id": "68b42008f6e53fed",
    },{
      "id": "8ECrJ6gMcKxTaacREj",
      "name": "anothermeter",
      "obs_domain_id": "1",
      "cert_serial_number": "8ECrJ6gMcKxTaoNtdB",
      "org_id": "68b42008f6e53fed",
    },{ 
    ...

    meters.find_meter("host.example.com")
    => 
    {
      "id": "8ECrJ6gMcKxTaoNtdA",
      "name": "host.example.com",
      "obs_domain_id": "1",
      "cert_serial_number": "8ECrJ6gMcKxTaoNtdB",
      "org_id": "68b42008f6e53fed",
    }

    meters.delete("host.example.com")

This may become more complete over time.

