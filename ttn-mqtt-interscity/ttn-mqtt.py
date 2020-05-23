import time
import ttn

app_id = "teste-brunomr"
access_key = "ttn-account-v2.fHGl_rxiFcUUAr96fOzO0_caeTflopfdVAfU1TGm6h8"

def uplink_callback(msg, client):
  print("Received uplink from ", msg.dev_id)
  print(msg)

handler = ttn.HandlerClient(app_id, access_key)

# using mqtt client
mqtt_client = handler.data()
mqtt_client.set_uplink_callback(uplink_callback)
print("stetting up everything")
mqtt_client.connect()
print("connected!!")
time.sleep(600)
mqtt_client.close()


