import requests
import datetime



inf = '{"data": {"environment_monitoring": [{"temperatura": 11,"timestamp": "2020-05-23T13:52:25.428Z"}]}}'
headers = {'content-Type': 'application/json'}


r = requests.post("http://34.95.144.147:8000/adaptor/resources/652cb918-c660-48d2-8ae6-a907f3b7ffe1/data", data = inf, headers=headers)
print(r)
print(r.content)

