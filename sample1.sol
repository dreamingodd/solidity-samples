pragma solidity ^0.4.0;

contract sample1 {
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
