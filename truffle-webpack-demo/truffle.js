// Allows us to use ES6 in our migrations and tests.
require('babel-register')
const Web3 = require('web3')

module.exports = {
  env: "rinkeby",
  networks: {
    development: {
      host: 'localhost',
      port: 8545,
      network_id: '*' // Match any network id
    },
    rinkeby: {
      host: '192.168.213.170',
      port: 8555,
      network_id: '*'，
      coinbase: '0xad837b3c9c34295e797d94fb421c4b9280fc6d1f',
      password: 'mvc123$%^',
    },
    live: {
      network_id: "*",
      provider: new Web3.providers.HttpProvider('https://mvchain.xyz'),
      gas: 430000,
      gasPrice: 2200000000,
    }
  }
}
