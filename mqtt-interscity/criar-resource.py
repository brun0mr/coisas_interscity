import requests
import json


headers = {'content-Type': 'application/json'}

print("criando resource")
data = '{"data": {"description": "misiot_sensor_1","capabilities": ["temperatura"],"status": "active","lat": 0,"lon": 0}}'
r = requests.post("http://34.95.144.147:8000/catalog/resources", data=data, headers=headers)
print(r)
print(r.content)
