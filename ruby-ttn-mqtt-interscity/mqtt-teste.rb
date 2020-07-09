require "mqtt"

topico = "#"

client = MQTT::Client.connect(:host => '134.122.122.88', :port => 1883, username: "misiot", password: "ttn-account-v2.ck6KZ_cV4Ls8T12G2QXCKzN5szKVSs0-oxvNrdx9ZIw")

client.subscribe(topico)

client.get do |topic, message|
    puts message
end