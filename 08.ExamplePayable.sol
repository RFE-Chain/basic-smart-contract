//SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract SampleContract {
    string public myString = "Hello World";

    function updateString(string memory _newString) public payable {
        if(msg.value == 2 ether) {
            myString = _newString;
        } else {
            payable(msg.sender).transfer(msg.value);
        }
    }
}