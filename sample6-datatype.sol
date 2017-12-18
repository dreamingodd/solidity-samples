pragma solidity ^0.4.0;

contract DataTypes {
    
    bool bool1 = false;
    
    int8 i8 = -128;
    uint8 ui8 = 255;
    
    string str;
    uint8[] strArr;
    
    byte byte1;
    bytes1 b1;
    bytes11 byte111;
    
    // fixed256x8 fix1 = 0.1; // 255.00
    // ufixed uf1 = 0.5;
    
    enum Action {ADD, REMOVE, UPDATE}
    
    Action a1 = Action.ADD;
    // Action a2 = 0;
    
    address address1;
    
    function assignAddress() public {
        address1 = msg.sender;
        address1.balance;
        address1.transfer(10);
    }
    
    
    uint[] myIntArr = [222,223];
    
    function arrFunc() {
        myIntArr.push(1);
        myIntArr.length;
        myIntArr[0];
    }
    
    uint[10] myFixdArr;
    
    struct Account {
        uint balance;
        uint dailyLimit;
    }
    
    Account account1;
    
    function structFunc() {
        account1.balance = 0;
        account1.dailyLimit;
    }
    
    mapping(address => Account) _accounts;
    
    function mappingFunc() payable {
        _accounts[msg.sender].balance += msg.value;
    }
    
    function getBalance() returns (uint) {
        return _accounts[msg.sender].balance;
    }
}