require "mqtt"
require 'httparty'
require "time"

topico = "#"

client = MQTT::Client.connect(:host => '134.122.122.88', :port => 1883)

client.subscribe(topico)

client.get do |topic, message|
  puts "topico : #{topic}, mensagem : #{message}"
  infos = topic.split("/")
  uuid = infos[1]
  capabilitie = infos[3]
  now = Time.now
  now = now.utc.iso8601
  #tem que arrumar os dados no data, so da pra fazer interpolation com aspas duplas
  data = {"data": {"environment_monitoring": [{"#{capabilitie}": message,"timestamp": now}]}}
 
  response = HTTParty.post("http://34.95.144.147:8000/adaptor/resources/#{uuid}/data", :headers => {'content-type': 'application/json'}, :body => data.to_json)

  puts response.code, response.body
  if (response.code == 201)
    puts "Mensagem encaminhada para o interscity!"
  else 
    puts "Erro!"
  end
end


#topic default /{uuid}/data/{capabilitie}
