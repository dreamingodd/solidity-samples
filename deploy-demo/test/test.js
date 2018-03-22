var HumanStandardToken = artifacts.require("./HumanStandardToken.sol");
const TruffleConfig = require('../truffle.js');

contract('HumanStandardToken', (accounts) => {

  const config = TruffleConfig.networks.development;
  if (TruffleConfig.env === 'PROD') {
    const web3 = new Web3(config.provider);
    console.log('>> Unlocking account ' + config.coinbase);
    web3.personal.unlockAccount(TruffleConfig.networks.coinbase, TruffleConfig.networks.password, 1000);
  }
  var creatorAddress = TruffleConfig.networks.coinbase;

  it("should contain 10000 MyToken in circulation", () => {
    return HumanStandardToken.deployed().then((instance) => {
      return instance.totalSupply.call();
    }).then(balance => {
      assert.equal(balance.valueOf(), 10000000000, "10000000000 tokens are not in circulation");
    });
  });
});
