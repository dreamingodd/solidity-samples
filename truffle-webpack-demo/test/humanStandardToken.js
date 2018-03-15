import 'babel-polyfill';

const HumanStandardToken = artifacts.require("./HumanStandardToken.sol");

contract('HumanStandardToken Tests', function(accounts){

  let creator = accounts[0]
  let receiver = accounts[1]
  let delegator = accounts[2]

  let addressA = accounts[3]
  let addressB = accounts[4]

  it("should put 1000 tokens in the first account", function() {
    return HumanStandardToken.deployed().then(function(instance) {
      return instance.balanceOf(creator)
    }).then(function(balance) {
      assert.equal(balance.valueOf(), 1000)
    })
  })

  it("transfer tests", function(){
    let ywd
    return HumanStandardToken.deployed().then(function(instance) {
      ywd = instance;
      instance.transfer(receiver, 5, {from: creator})
    }).then(function(){
      return ywd.balanceOf(creator)
    }).then(function(balance){
      assert.equal(balance.valueOf(), 995)
    }).then(function(){
      return ywd.balanceOf(receiver)
    }).then(function(balance){
      assert.equal(balance.valueOf(), 5)
    })
  })

  it("approve allowance tranferFrom tests", function() {
    let ywd
    return HumanStandardToken.deployed().then(function(instance) {
      ywd = instance
      return ywd.approve(delegator, 2, {from: creator})
    }).then(function(result){
      assert(result, true)
    }).then(function(){
      return ywd.transferFrom(creator, receiver, 1, {from: delegator})
    }).then(function(result){
      assert(result, true)
      return ywd.allowance(creator, delegator)
    }).then(function(allowance){
      assert(allowance, 1)
      return ywd.balanceOf(creator)
    }).then(function(balance){
      assert(balance, 999)
      return ywd.balanceOf(receiver)
    }).then(function(balance){
      assert(receiver, 1)
    })
  })
})
