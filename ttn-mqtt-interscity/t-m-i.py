import time
import ttn

app_id = "foo"
access_key = "ttn-account.eiPq8mEeYRL_PNBZsOpPy-O3ABJXYWulODmQGR5PZzg"

def uplink_callback(msg, client):
  print("Received uplink from ", msg.dev_id)
  print(msg)

handler = ttn.HandlerClient(app_id, access_key)

# using mqtt client
mqtt_client = handler.data()
mqtt_client.set_uplink_callback(uplink_callback)
mqtt_client.connect()
time.sleep(60)
mqtt_client.close()