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
    #@res_list = HTTParty.get("http://34.95.144.147:8000/catalog/resources", :headers => {'content-type': 'application/json'})
    listen()
  end

  def listen()
    @client.connect(@address)
    puts "connected"

    # Subscribe to a topic
    @client.subscribe([@topic, 2])
    puts "subscribed"
    # Waiting for the suback answer
    while @waiting_suback do
      sleep 0.001
    end

    @client.on_message do |message|
      puts message.topic
      puts message.payload
    end
  end

  def forwardMessageToAPI(topic, payload)
    
    puts topic
    puts payload
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