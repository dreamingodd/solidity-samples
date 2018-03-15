import 'babel-polyfill';

const HumanStandardToken = artifacts.require("./HumanStandardToken.sol");

contract('HumanStandardToken Tests', async (accounts) => {

  let creator = accounts[0]
  let receiver = accounts[1]
  let delegator = accounts[2]

  let addressA = accounts[3]
  let addressB = accounts[4]

  let ywd

  // console.log(HumanStandardToken)
  beforeEach("create the contract", async () => {
    ywd = await HumanStandardToken.new(1000, 'Ye Wenda', 10, "YWD")
  })

  it("should put 1000 YWD in the first account", async () => {
     let balance = await ywd.balanceOf.call(creator)
     assert.equal(balance.valueOf(), 1000)
  })

  it("should transfer 5 to receiver", async () =>{
    let result = await ywd.transfer.call(receiver, 5, {from: creator});
    let balance1 = await ywd.balanceOf.call(creator);
    let balance2 = await ywd.balanceOf.call(receiver);
    assert.equal(result, true)
    assert.equal(balance1.valueOf(), 995)
    assert.equal(balance2.valueOf(), 5)
  })

})
