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
    payload = '{"data":{"environment_monitoring":[{"temperature": "30.0","timestamp": "13/04/2020T109:29:00"}]}}'
    y = json.loads(payload)
    y["data"]["environment_monitoring"][0]["temperature"] = temp
    y["data"]["environment_monitoring"][0]["timestamp"] = data
    r = requests.post('http://34.95.169.45:8000/adaptor/resources/45e9d1cc-f373-4d8b-bab2-c02cf017d830', data=y)
    print("postado no interscity")
    print(r)
    print(r.content)

subscribe.callback(on_message, "teste", hostname = "134.122.122.88", port=1883 )

        
       
# auth = {‘username’:”<bruno>”, ‘password’:”<bruno>”}