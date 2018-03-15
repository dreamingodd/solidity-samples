// Allows us to use ES6 in our migrations and tests.
require('babel-register')
const Web3 = require('web3')

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: 8545,
      network_id: '*' // Match any network id
    },
    live: {
      network_id: "*",
      provider: new Web3.providers.HttpProvider('https://mvchain.xyz'),
      gas: 430000,
      gasPrice: 2200000000,
    }
  }
}
