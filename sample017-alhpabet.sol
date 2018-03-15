pragma solidity ^0.4.11;

interface Letter {
    function n() public returns(uint);
}

contract A is Letter {
    function n() public returns(uint) {
        return 1;
    }
}


contract B is A {}

contract C is Letter {
    function n() public returns(uint) {
        return 3;
    }
    
    function x() public returns(string) {
        return "c";
    }
}

contract Alphabet {
    
    event Printer(uint);
    
    Letter[] private letters;
    
    function Alphabet() {
        letters.push(new A());
        letters.push(new B());
        letters.push(new C());
    }
    
    function print() {
        for (uint i = 0; i < letters.length; i++) {
            Printer(letters[i].n());
        }
    }
}

