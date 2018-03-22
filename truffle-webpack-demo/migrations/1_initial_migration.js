const Web3 = require('web3');
const TruffleConfig = require('../truffle.js');
var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {

  if (TruffleConfig.env === 'rinkeby') {
    const config = TruffleConfig.networks.rinkeby;
    let rpcUrl = "http://" + config.host + ":" + config.port;
    console.log(rpcUrl);
    const web3 = new Web3(new Web3.providers.HttpProvider(rpcUrl));
    web3.personal.unlockAccount(config.coinbase, config.password, 1000);
  }
  deployer.deploy(Migrations);
  console.log("$$$$$$$---migrations deployed!");
};
