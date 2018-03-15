pragma solidity ^0.4.12;

contract Casino {
    
    uint private start;
    
    uint private winnerSeed;
    bool private hasWinner;
    address private winner;
    
    uint private buyPeriod = 1000;
    uint private verifyPeriod = 100;
    uint private checkPeriod = 100;
    
    mapping(address => uint) _tickets;
    mapping(address => uint) private _winnings;
    
    address[] _entries;
    address[] _verifications;
    
    function Casino() public {
        start = block.timestamp;
    }
    
    /** This is not a part of the contract */
    function unsafeEntry(uint number, uint salt) public payable returns (bool) {
        return buyTicket(this.generateHash(number, salt));
    }
    
    function generateHash(uint number, uint salt) external pure returns(uint) {
        return uint(keccak256(number + salt));
    }
    
    function buyTicket(uint hash) public payable returns (bool) {
        // within the timeframe
        require(block.timestamp < start + buyPeriod);
        // Correct amount
        require(msg.value == 1 ether);
        // 
        require(_tickets[msg.sender] == 0);
        _tickets[msg.sender] = hash;
        _entries.push(msg.sender);
        return true;
    }
    
    function verifyTicket(uint number, uint salt)
        public
        returns(bool) {
        // within the timeframe
        require(block.timestamp >= start + buyPeriod);
        require(block.timestamp < start + buyPeriod + verifyPeriod);
        // has a valid entry
        require(_tickets[msg.sender] > 0);
        // validate hash
        require(this.generateHash(number, salt) == _tickets[msg.sender]);
        require(salt > number);
        winnerSeed = winnerSeed ^ salt ^ uint(msg.sender);
        _verifications.push(msg.sender);
    }
    
    function checkWinner()
        public
        returns (bool) {
        // Within the timeframe
        require(block.timestamp >= start + buyPeriod + verifyPeriod);
        require(block.timestamp < start + buyPeriod + verifyPeriod + checkPeriod);
        if (!hasWinner) {
            winner = _verifications[winnerSeed % _verifications.length];
            _winnings[winner] = _verifications.length - 1 ether;
            hasWinner = true;
        }
        return msg.sender == winner;
    }
    
    function claim()
        public {
        // Has winnings to claim
        require(_winnings[msg.sender] > 0);
        msg.sender.transfer(_winnings[msg.sender]);
        _winnings[msg.sender] = 0;
    }
    
}