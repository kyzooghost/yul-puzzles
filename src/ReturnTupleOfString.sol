// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTupleOfString {
    function main() external pure returns (string memory, string memory) {
        assembly {
            // your code here
            // return the tuple of string: ("Hello", "RareSkills")
            
            // Offsets
            mstore(0x00, 0x40)
            mstore(0x20, 0x80)
            // "Hello"
            mstore(0x40, 5)
            mstore(0x60, 0x48656c6c6f000000000000000000000000000000000000000000000000000000)
            // "RareSkills"
            mstore(0x80, 10)
            mstore(0xA0, 0x52617265536b696c6c7300000000000000000000000000000000000000000000)
            return(0x00, 0xC0)
        }
    }
}
