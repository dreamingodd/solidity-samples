const Web3 = require('web3');

const TruffleConfig = require('../truffle.js');

var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer) {

  if (TruffleConfig.env === 'rinkeby') {
    const config = TruffleConfig.networks.rinkeby
    let rpcUrl = "http://" + config.host + ":" + config.port
    console.log('Rinkeby URL: ' + rpcUrl)
    const web3 = new Web3(new Web3.providers.HttpProvider(rpcUrl))
    web3.personal.unlockAccount(config.coinbase, config.password, 1000)
  } else if (TruffleConfig.env === 'live') {
    const config = TruffleConfig.networks.live;
    const web3 = new Web3(config.provider)
    web3.personal.unlockAccount(config.coinbase, config.password, 1000)
  }
  console.log('>> Deploying migration');
  deployer.deploy(Migrations);
};
