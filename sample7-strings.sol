pragma solidity ^0.4.0;

library Strings {
    function concat(string _str1, string _str2) internal returns (string) {
        bytes memory _baseBytes1 = bytes(_str1);
        bytes memory _baseBytes2 = bytes(_str2);
        
        string memory _tmpValue = new string(_baseBytes1.length + _baseBytes2.length);
        bytes memory _newValue = bytes(_tmpValue);
        
        uint i;
        uint j;
        
        for (i = 0; i < _baseBytes1.length; i++) {
            _newValue[j++] = _baseBytes1[i];
        }
        for (i = 0; i < _baseBytes2.length; i++) {
            _newValue[j++] = _baseBytes2[i];
        }
        
        return string(_newValue);
    }
    
    function strpos(string _str1, string _str2) internal returns(int) {
        bytes memory _baseBytes1 = bytes(_str1);
        bytes memory _baseBytes2 = bytes(_str2);
        
        assert(_baseBytes1.length == 1);
        
        return -1;
    }
}

contract TestStrings {
    using Strings for string;
    
    function testConcat(string _str) returns (string) {
        return _str.concat("_suffix");
    }
}