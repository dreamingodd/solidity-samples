pragma solidity ^0.4.0;


// The external methods consume less gas. 
contract ExternalContract {
    function externalCall() external returns (uint) {
        return 111;
    }
    
    function publicCall() public returns (uint) {
        return 111;
    }
}