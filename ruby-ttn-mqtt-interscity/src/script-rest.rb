require "mqtt"
require 'httparty'
require "time"

topico = "#"
uuid = ""
capabilities = ""

response = HTTParty.get("http://34.95.144.147:8000/catalog/resources", :headers => {'content-type': 'application/json'})

client = MQTT::Client.connect(:host => 'brazil.thethings.network', :port => 1883, :username => 'misiot', :password => 'ttn-account-v2.ck6KZ_cV4Ls8T12G2QXCKzN5szKVSs0-oxvNrdx9ZIw')

client.subscribe(topico)

client.get do |topic, message|
  puts "topico : #{topic}, mensagem : #{message}"
  dev_id = message.scan /"dev_id":"(\w+)"/
  payload_raw = message.scan /"payload_raw":"(\w+\S{0,3})"/
  dev_id = dev_id[0][0]
  payload_raw = payload_raw[0][0]
  response["resources"].each do |i| 
    if(i["description"] === dev_id)
        uuid = i["uuid"]
        capabilities = i["capabilities"]
        break
    end
  end

  data = {"data": {"environment_monitoring": [{"#{capabilities[0]}": payload_raw,"timestamp": Time.now.utc.iso8601}]}}
 
  response = HTTParty.post("http://34.95.144.147:8000/adaptor/resources/#{uuid}/data", :headers => {'content-type': 'application/json'}, :body => data.to_json)

  puts response.code
  if (response.code == 201)
    puts "Mensagem encaminhada para o interscity!"
  else 
    puts "Erro!"
  end
  File.open("log.txt", "a") { |f| f.write "Message arrived in:#{Time.now.utc.iso8601} - Topic: #{topic} message: #{message} response code :#{response.code}.\n\n" }
end


#topic default /{uuid}/data/{capabilitie}
#/652cb918-c660-48d2-8ae6-a907f3b7ffe1/data/temperatura