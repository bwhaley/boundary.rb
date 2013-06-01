boundary.rb
=======

A ruby library for the [Boundary](http://boundary.com) API.

Currently only meter list, search and delete are supported.

    auth = {}
    auth[:org] = ENV['BOUNDARY_ORG_ID'] 
    auth[:key] = ENV['BOUNDARY_API_KEY']
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

    meters.search("host.example.com")
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

