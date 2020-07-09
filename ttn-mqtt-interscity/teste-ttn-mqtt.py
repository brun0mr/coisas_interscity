import paho.mqtt.subscribe as subscribe



def on_message(client, userdata, message):
    temp = str(message.payload.decode("utf-8"))
    print(temp)
    print

subscribe.callback(on_message, "#", hostname = "brazil.thethings.network", port=1883, auth = {"username":"misiot", "password": "ttn-account-v2.ck6KZ_cV4Ls8T12G2QXCKzN5szKVSs0-oxvNrdx9ZIw"} )
print("listening...")