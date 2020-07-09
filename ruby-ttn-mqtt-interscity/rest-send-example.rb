require 'httparty'
require "time"
#capabilitie = "teste"
#temp = 25
#data = {'data': {'environment_monitoring': [{"#{capabilitie}": temp,'timestamp': '2020-05-23T13:52:25.428Z'}]}}
#inf = '{"data": {"environment_monitoring": [{"temperatura": 15,"timestamp": "2020-05-23T13:52:25.428Z"}]}}'

#response = HTTParty.post("http://34.95.144.147:8000/adaptor/resources/652cb918-c660-48d2-8ae6-a907f3b7ffe1/data", :headers => {'content-type': 'application/json'}, :body => data.to_json)

#puts response.code, response.body
#puts data.to_json
#puts data

def send_message_inct(topic,message)
  
    infos = topic.split("/")
    uuid = infos[1]
    capabilitie = infos[3]
    now = Time.now
    local_time = now
    local_time = local_time.utc.iso8601
    data = {"data": {"sala": [{"#{capabilitie}": message,"timestamp": local_time}]}}
    response = HTTParty.post("http://34.95.144.147:8000/adaptor/resources/#{uuid}/data", :headers => {'content-type': 'application/json'}, :body => data.to_json)
    puts response.code, response.body
  end

send_message_inct("/652cb918-c660-48d2-8ae6-a907f3b7ffe1/data/temperatura",66)