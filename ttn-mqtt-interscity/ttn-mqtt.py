import time
import ttn
import base64

#app_id = "waste_management"
#access_key = "ttn-account-v2.UM5JNRERzx9aZhppyqmi9-PxW8fvD9fir2xAZRsjiEA"

app_id = "misiot"
access_key = "ttn-account-v2.ck6KZ_cV4Ls8T12G2QXCKzN5szKVSs0-oxvNrdx9ZIw"


def uplink_callback(msg, client):
  print("Received uplink from ", msg.dev_id)
  print(msg)

handler = ttn.HandlerClient(app_id, access_key)

# using mqtt client
mqtt_client = handler.data()
mqtt_client.set_uplink_callback(uplink_callback)
print("setting up everything")
mqtt_client.connect()
print("connected!!")
time.sleep(600)
mqtt_client.close()


