const Web3 = require('web3')

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  env: 'PROD',
  networks: {
    development: {
      network_id: "*",
      provider: new Web3.providers.HttpProvider('https://mvchain.xyz'),
      gas: 430000,
      gasPrice: 2200000000,
    },
    coinbase: "0xe268d8c22739b9abdabdfb14763ff60d0de5e3ba",
    password: "mvc123$%^"
  },
  // networks: {
    // development: {
      // host: "localhost",
      // port: "8545",
      // network_id: "*"
    // }
  // }
};
