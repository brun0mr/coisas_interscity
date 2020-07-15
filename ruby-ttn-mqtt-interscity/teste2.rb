require 'base64'


str = '{"app_id":"misiot","dev_id":"misiot_sensor_1","hardware_serial":"002887DDA758EA5E","port":1,"counter":15297,"payload_raw":"Hw==","metadata":{"time":"2020-07-14T22:06:19.837268536Z","frequency":433.175,"modulation":"LORA","data_rate":"SF9BW125","airtime":164864000,"coding_rate":"4/5","gateways":[{"gtw_id":"eui-a4cf12ffff02d0e0","timestamp":3054257458,"time":"","channel":0,"rssi":-16,"snr":13,"rf_chain":0,"latitude":-23.53257,"longitude":-46.68959,"altitude":760}]}}'

dev_id = str.scan /"dev_id":"(\w+)"/
payload_raw = str.scan /"payload_raw":"(\w+\S{0,3})"/

i = payload_raw[0][0]


