import requests
import datetime



inf = '{"data": {"environment_monitoring": [{"teste": 11,"timestamp": "2020-05-23T13:52:25.428Z"}]}}'
headers = {'content-Type': 'application/json'}


r = requests.post("http://34.95.169.45:8000/adaptor/resources/efdf3513-2235-4aee-a59f-28dce7053f6e/data", data = inf, headers=headers)
print(r)
print(r.content)

