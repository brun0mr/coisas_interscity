require "mqtt"
require 'httparty'
require "time"

topico = "#"
uuid = ""

response = HTTParty.get("http://34.95.144.147:8000/catalog/resources", :headers => {'content-type': 'application/json'})

client = MQTT::Client.connect(:host => '134.122.122.88', :port => 1883)

client.subscribe(topico)

client.get do |topic, message|
  puts "topico : #{topic}, mensagem : #{message}"
  message
  data = {"data": {"environment_monitoring": [{"#{capabilitie}": message,"timestamp": now}]}}
 
  response = HTTParty.post("http://34.95.144.147:8000/adaptor/resources/#{uuid}/data", :headers => {'content-type': 'application/json'}, :body => data.to_json)

  puts response.code
  if (response.code == 201)
    puts "Mensagem encaminhada para o interscity!"
  else 
    puts "Erro!"
  end
  File.open("log.txt", "a") { |f| f.write "Message arrived in:#{now} - Topic: #{topic} message: #{message} response code :#{response.code}.\n\n" }
end


#topic default /{uuid}/data/{capabilitie}
#/652cb918-c660-48d2-8ae6-a907f3b7ffe1/data/temperatura