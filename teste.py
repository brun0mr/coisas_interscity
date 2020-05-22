import requests
import datetime



inf = {"data": {"environment_monitoring": [{"temperature": 10,"timestamp": "2020-005-22T13:52:25.428Z"}]}}

r = requests.post("http://34.95.169.45:8000/adaptor/resources/45e9d1cc-f373-4d8b-bab2-c02cf017d830/data", data = inf)
print(r)
print(r.content)
