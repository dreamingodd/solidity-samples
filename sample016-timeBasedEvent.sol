pragma solidity ^0.4.0;

contract TimeBased {
     mapping(address => uint) public _balanceOf;
     mapping(address => uint) public _expiryOf;
     
     uint private leaseTime = 600;
     
     modifier expire(address _address) {
         if (_expiryOf[_address] >= block.timestamp) {
             _expiryOf[_address] = 0;
             _balanceOf[_address] = 0;
         }
         _;
     }
     
     function lease()
        public
        expire(msg.sender)
        payable returns(bool) {
         require(msg.value == 1 ether);
         require(_balanceOf[msg.sender] == 0);
         _balanceOf[msg.sender] = 1;
         _expiryOf[msg.sender] = block.timestamp + leaseTime;
     }
     
     function balanceOf() public returns (uint) {
         return _balanceOf[msg.sender];
     }
     
     function expiryOf() public returns (uint) {
         return _expiryOf[msg.sender];
     }
     
     function balanceOf(address _address)
        public
        expire(_address)
        returns (uint) {
         return _balanceOf[_address];
     } 
     
     function expiryOf(address _address) 
        public
        expire(_address)
        returns (uint) {
         return _expiryOf[_address];
     }
}