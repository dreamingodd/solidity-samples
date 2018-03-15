pragma solidity ^0.4.0;


contract Transaction {
    
    // seems an event is for logging.
    event SenderLogger(address);
    event ValueLogger(uint);
    event InfoLogger(string);
    
    address private owner;
    
    modifier isOwner {
        require(owner == msg.sender);
        _;
    }
    
    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }
    
    function Transaction() {
        owner = msg.sender;
    }
    
    // fallback is a function which allows accounts pay to our contract address
    function () payable isOwner validValue {
        SenderLogger(msg.sender);
        SenderLogger(tx.origin);
        ValueLogger(msg.value);
        InfoLogger("Block Number:");
        ValueLogger(block.number);
    }
    
    function getBalance(address _address) public returns(uint) {
        return address(_address).balance;
    }
    
    function getBalance() public returns(uint) {
        
        SenderLogger(this);
        return address(this).balance;
    }
}