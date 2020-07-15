import time
import ttn
import base64
import json
import requests

#app_id = "waste_management"
#access_key = "ttn-account-v2.UM5JNRERzx9aZhppyqmi9-PxW8fvD9fir2xAZRsjiEA"
resources = requests.get("http://34.95.144.147:8000/catalog/resources", headers = {'content-type': 'application/json'})
app_id = "misiot"
access_key = "ttn-account-v2.ck6KZ_cV4Ls8T12G2QXCKzN5szKVSs0-oxvNrdx9ZIw"
headers = {'content-Type': 'application/json'}

def uplink_callback(msg, client):
  print("Received uplink from ", msg.dev_id)
  data = msg.payload_raw
  temp = msg.metadata.time
  payload = '{"data": {"environment_monitoring": [{"teste": %s,"timestamp": "%s"}]}}' %(data, temp)
  for i in resources["resources"]:
    if i["description"] == msg.dev_id:
      uuid = i["uuid"]
      break

  print (payload)
  print (uuid)
  #r = requests.post("http://34.95.169.45:8000/adaptor/resources/efdf3513-2235-4aee-a59f-28dce7053f6e/data", data = payload, headers=headers)

handler = ttn.HandlerClient(app_id, access_key)

# using mqtt client
mqtt_client = handler.data()
mqtt_client.set_uplink_callback(uplink_callback)
print("setting up everything")
mqtt_client.connect()
print("connected!!")
time.sleep(600)
mqtt_client.close()


