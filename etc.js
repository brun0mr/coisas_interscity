const util = require('util');
const axios = require('axios');




//mqtt


var resource = {
  "data": {
    "description": "Termostato - Quarto NOVO",
    "capabilities": [
      "termostato"
    ],
    "status": "active",
    "lat": -23.559616,
    "lon": -46.731386
  }
};

var updated_resource = {
  "data": {
    "description": "Teste de capabilities updated",
    "capabilities": [
      "illuminate"
    ],
    "status": "inactive",
    "lat": -23.559616,
    "lon": -46.731386
  }
};

var subscription = {
  "subscription": {
    "uuid": "0e76dc01-5a85-4e3d-98a0-867505c10b3d",
    "capabilities": [
      "termostato"
    ],
    "url": "http://10.144.0.1"
  }
};

var actuator = {
  "data": [
    {
      "uuid": "45e9d1cc-f373-4d8b-bab2-c02cf017d830",
      "capabilities": 
      {
        "temperature": "67"
      }
    }
  ]
};

var updated_subscription = {
  "subscription": {
    "url": "http://10.144.0.1"
  }
};

/* NOVO RESOURCE */
// axios.post('http://134.122.122.88:8000/catalog/resources', resource)
//   .then(function (response) {
//     console.log(response.data);
//   })
//   .catch(function (error) {
//     console.log(error);
//   });

// /* NOVA SUBSCRIPTION */
// axios.post('http://134.122.122.88:8000/adaptor/subscriptions', subscription)
//   .then(function (response) {
//     console.log(response.data);
//   })
//   .catch(function (error) {
//     console.log(error);
//   });

/* UPDATE RESOURCE */
  // axios.put('http://134.122.122.88:8000/catalog/resources/c5be3854-9834-48df-b0c3-8fb6c4b6e54c', updated_resource)
  // .then(function (response) {
  //   console.log(response.data);
  // })
  // .catch(function (error) {
  //   console.log(error);
  // });

/* SEND ACTUATOR COMMAND */
  axios.post('http://34.95.169.45:8000/actuator/commands', actuator)
  .then(function (response) {
    console.log(response.data);
  })
  .catch(function (error) {
    console.log(error);
  });