import requests
import datetime

inf = {"data": [{"temperature": 10,"timestamp": "2017-06-14T17:52:25.428Z"},]}
inf["data"][0]["timestamp"] = datetime.datetime.utcnow().isoformat()

r = requests.post("http://34.95.169.45:8000/adaptor/resources/45e9d1cc-f373-4d8b-bab2-c02cf017d830/data/temperature", data=inf)
print(r)
print(r.content)