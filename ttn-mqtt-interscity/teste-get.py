import requests

req = requests.get("http://34.95.144.147:8000/catalog/resources", headers = {'content-type': 'application/json'})
resources = req.content.decode("utf-8")
print(resources[""])
