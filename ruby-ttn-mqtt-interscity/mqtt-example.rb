require "paho-mqtt"
require 'httparty'


class MQTTBridge
  def initialize(address, port, topic ='#',user = nil ,pass = nil)
    @address = address
    @port = port
    @topic = topic
    @pass = pass
    @user = user
    @client = PahoMqtt::Client.new({host: @address, port: @port,username: @user, password: @pass})
    
    listen()
  end

  def listen()
    @client.connect(@address)
    puts "connected"

    # Subscribe to a topic
    @client.subscribe([@topic, 2])
    puts "subscribed"

    @@res_list = HTTParty.get("http://34.95.144.147:8000/catalog/resources", :headers => {'content-type': 'application/json'})
    # Waiting for the suback answer
    while @waiting_suback do
      sleep 0.001
    end

    @client.on_message do |message|
      forwardMessageToAPI(message.topic, message.payload)
    end
  end

  def forwardMessageToAPI(topic, payload)
    
    uuid = ""
    id = ""
    time = ""
    payload_raw = ""
    #time = payload["metadata"]["time"]
    #id = payload["dev_id"]
    #payload_raw = payload["payload_raw"]

    #@res_list["resources"].each do |i| 
     # if(i["description"] === id)
      #    uuid = i["uuid"]
       #   break
      #end
    #end
    payload = payload.encode("utf-8")
    
    puts payload[""]
    puts "\n"
    
    #req = {}
    #req[:data] = [{ "#{capability}" => payload, "timestamp" => Time.now.utc.iso8601 }]
    #res = HTTParty.post("http://34.95.144.147:8000/adaptor/resources/#{uuid}/data/#{capability}", :headers => {'content-type': 'application/json'}, :body => req.to_json)

    # DEBUG MODE
    # TODO: remover os prints
    #msg = ''
    #if (res.code == 201)
     # msg = 'Enviado'
   # else 
     # msg = 'Erro'
   # end
  end
end


bridge = MQTTBridge.new("brazil.thethings.network", 1883,"#","misiot","ttn-account-v2.ck6KZ_cV4Ls8T12G2QXCKzN5szKVSs0-oxvNrdx9ZIw")

sleep(999999999999)