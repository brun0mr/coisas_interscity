import paho.mqtt.subscribe as subscribe



def on_message(client, userdata, message):
    temp = str(message.payload.decode("utf-8"))
    print(temp.dev_id)
    payload = '{"data": {"environment_monitoring": [{"teste": %s,"timestamp": "%s"}]}}' %(temp, data)
    r = requests.post("http://34.95.169.45:8000/adaptor/resources/efdf3513-2235-4aee-a59f-28dce7053f6e/data", data = payload, headers=headers)

subscribe.callback(on_message, "#", hostname = "brazil.thethings.network", port=1883, auth = {"username":"misiot", "password": "ttn-account-v2.ck6KZ_cV4Ls8T12G2QXCKzN5szKVSs0-oxvNrdx9ZIw"} )
print("listening...")