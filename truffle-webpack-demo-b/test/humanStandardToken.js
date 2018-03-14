const HumanStandardToken = artifacts.require("./HumanStandardToken.sol");

contract('HumanStandardToken Tests', async (accounts) => {

  var creator = accounts[0]
  var receiver = accounts[1]
  var delegator = accounts[2]

  var addressA = accounts[3]
  var addressB = accounts[4]

  let ywd

  // console.log(HumanStandardToken)

  it("should put 10000 MetaCoin in the first account", async () => {
     let instance = await HumanStandardToken.deployed();
     let balance = await instance.getBalance.call(accounts[0]);
     assert.equal(balance.valueOf(), 0);
  })

})
