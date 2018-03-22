pragma solidity ^0.4.18;

import "truffle/Assert.sol";
/* import "truffle/DeployedAddresses.sol"; */
import "../contracts/HumanStandardToken.sol";

contract TestHumanStandardToken {

  HumanStandardToken private ywd;
  address private _owner;

  function beforeEach() internal {
    _owner = msg.sender;
  }

  function TestHumanStandardToken() {
    ywd = new HumanStandardToken();
  }

  function testConstructor() public {
    /* HumanStandardToken HST = HumanStandardToken(DeployedAddresses.HumanStandardToken()); */
    uint allocatedTokens = ywd.balanceOf(this);
    Assert.equal(allocatedTokens, 100, "Contract creator should hold 100 tokens.");
  }

  function testTransfer() public {
    ywd.transfer(_owner, 99);
    uint _balance = ywd.balanceOf(_owner);
    Assert.equal(_balance, 99, "The owner should hold 100 tokens.");
  }

  function testTransferTooMuch() public {
    bool result = ywd.transfer(_owner, 2);
    Assert.equal(result, false, "Not enough token, should fail!");
  }

  // ERC223 have the feature to confirm a valid address
  // TODO make the damn test pass.
  function testTransferFrom() public {
    bool result = ywd.transferFrom(_owner, this, 1);
    Assert.equal(result, true, "No comment.");
  }

  function testApprove() public {
    bool result = ywd.approve(_owner, 5);
    Assert.equal(result, true, "Approval method should pass.");
  }

  // Approve in MVC doesn't have the
  function testApproveTooMuch() public {
    bool result = ywd.approve(_owner, 5555555);
    Assert.equal(result, false, "Approval method should fail.");
  }

  function testAllowance() public {
    uint allowance = ywd.allowance(_owner, this);
    Assert.equal(allowance, 0, "Spender should have a balance.");
  }

  function testAllowanceWithApprove() public {
    ywd.approve(_owner, 10);
    uint allowance = ywd.allowance(_owner, this);
    Assert.equal(allowance, 10, "Spender should have a balance of 100 available.");
  }
}
