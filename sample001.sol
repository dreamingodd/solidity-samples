pragma solidity ^0.4.0;

interface Regulator{
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;
    
    modifier ownerFunc {
        require(owner == msg.sender);
        _;
    }
    
    // function testThrow() {
    //     throw;
    // }
    
    function Bank(uint amount) {
        value = amount;
        owner = msg.sender;
    }
    
    function deposit(uint amount) ownerFunc{
        value += amount;
    }
    
    function withdraw(uint amount) ownerFunc{
        value -= amount;
    }
    
    function balance() returns (uint) {
        return value;
    }
    
    function checkValue(uint amount) returns (bool) {
        return value >= amount;
    }
    
    function loan() returns (bool) {
        return value > 0;
    }
}

contract Sample1 is Bank(10) {
    string private name;
    uint private age;
    
    function setName(string name1) {
        name = name1;
    }
    
    function getName() returns (string) {
        return name;
    }
    
    function setAge(uint age1) {
        age = age1;
    }
    
    function getAge() returns (uint) {
        return age;
    }
}

contract TestThrows {
    // consume gas on message sender
    function testAssert() {
        assert(1 == 2);
    }
    // if require faied, gas is not consumed
    function testRequrie() {
        require(2 == 1);
    }
    // return the consumed gas (e.g.ICO)
    function testRevert() {
        revert();
    }
    // consume all the gase possibly
    function testThrow() {
        throw;
    }
}