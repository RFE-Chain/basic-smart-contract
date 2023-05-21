// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExceptionExampleRequire {
    mapping(address => uint) balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint amount) public {
        // condition false, msg
        require(amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting");

        balanceReceived[msg.sender] -= amount;
        _to.transfer(amount);
    }
}