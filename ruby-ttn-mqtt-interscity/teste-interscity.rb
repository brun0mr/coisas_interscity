require 'httparty'

id = "sensor-1"
payload = "hallo"
uuid = ""

response = HTTParty.get("http://34.95.144.147:8000/catalog/resources", :headers => {'content-type': 'application/json'})


response["resources"].each do |i| 
    if(i["description"] === id)
        uuid = i["uuid"]
        break
    end
end

puts uuid