const Web3 = require('web3');

const TruffleConfig = require('../truffle.js');

var Storage = artifacts.require("./Storage.sol");

module.exports = function(deployer) {
  // const config = TruffleConfig.networks.development;
  // if (TruffleConfig.env === 'PROD') {
  //   const web3 = new Web3(config.provider);
  //   console.log('>> Unlocking account ' + config.coinbase);
  //   web3.personal.unlockAccount(TruffleConfig.networks.coinbase, TruffleConfig.networks.password, 1000);
  // }
  // console.log('>> Deploying migration');
  // deployer.deploy(Storage);
};
