pragma solidity ^0.4.0;

import "browser/ERC20.sol";
import "browser/ERC223.sol";
import "browser/ERC223ReceivingContract.sol";

contract tokenYWD is ERC20, ERC223 {
    string public constant symbol = "YWD";
    string public constant name = "token of YWD";
    uint8 public constant decimals = 18;
    
    uint private constant __totalSupply = 10000;
    
    mapping (address => uint) private __balanceOf;
    mapping (address => mapping(address => uint)) private __allowances;
    
    function totalSupply() constant returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
    }

    function tokenYWD() {
        __balanceOf[msg.sender] = __totalSupply;
    }

    function balanceOf(address addr) constant returns (uint balance) {
        return __balanceOf[addr];
    }

    function transfer(address _to, uint _val) returns (bool success) {
        if (_val > 0
            && _val <= balanceOf(msg.sender)
            && !isContract(_to)) {
            __balanceOf[msg.sender] -= _val;
            __balanceOf[_to] += _val;
            return true;
        }
        return false;
    }

    function transfer(address _to, uint _val, bytes _data) returns (bool success) {
        if (_val > 0
            && _val <= balanceOf(msg.sender)
            && isContract(_to)) {
            __balanceOf[msg.sender] -= _val;
            __balanceOf[_to] += _val;
            ERC223ReceivingContract _contract = ERC223ReceivingContract(_to);
            _contract.tokenFallback(msg.sender, _val, _data);
            Transfer(msg.sender, _to, _val, _data);
            return true;
        }
        return false;
    }
    
    
    function transferFrom(address _from, address _to, uint _val) returns (bool success){
        if (__allowances[_from][msg.sender] > 0
            && _val > 0
            && !isContract(_to)
            && __balanceOf[_from] >= _val
            && __allowances[_from][msg.sender] >= _val) {
            // __balanceOf[_from] -= _val;
            // __balanceOf[_to] += _val;
            Transfer(msg.sender, _to, _val);
            return true;
        }
        return false;
    }
    function approve(address _spender, uint _val) returns (bool success) {
        __allowances[msg.sender][_spender] = _val;
        Approval(msg.sender, _spender, _val);
        return true;
        
    }
    function allowance(address _owner, address _spender) constant returns (uint remaining){
        return __allowances[_owner][msg.sender];
    }
    
    //ERC223
    
    function isContract(address _address) returns (bool) {
        uint codeSize;
        assembly {
            codeSize := extcodesize(_address)
        }
        return codeSize > 0;
    }
    
}