import paho.mqtt.subscribe as subscribe
import requests
import datetime
import json



def on_message(client, userdata, message):
    print("salvando mensagem...")
    temp = str(message.payload.decode("utf-8"))
    data = datetime.datetime.utcnow().isoformat()
    print("a mensagem recebida foi :" + temp)
    print("Mandando para o interscity...")
    payload = '{"data": {"environment_monitoring": [{"teste": %s,"timestamp": "%s"}]}}' %(temp, data)
    r = requests.post("http://34.95.169.45:8000/adaptor/resources/efdf3513-2235-4aee-a59f-28dce7053f6e/data", data = json.dumps(y), headers=headers)
    print("postado no interscity")
    print(r)
    print(r.content)

subscribe.callback(on_message, "teste", hostname = "134.122.122.88", port=1883 )

        
       
# auth = {‘username’:”<bruno>”, ‘password’:”<bruno>”}