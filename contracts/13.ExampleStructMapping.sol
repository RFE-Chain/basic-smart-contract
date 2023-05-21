// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleStructMapping {
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposit;
        mapping (uint => Transaction) deposits;
        uint numWithdrawal;
        mapping  (uint => Transaction) withdrawals;
    }

    mapping(address => Balance) balanceReceived;

    function getBalance(address _addr) public view returns(uint) {
        return  balanceReceived[_addr].totalBalance;
    }

    function depositMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;

        // record deposit
        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balanceReceived[msg.sender].deposits[balanceReceived[msg.sender].numDeposit] = deposit;
        balanceReceived[msg.sender].numDeposit++;
    }

    function withdrawMoney(address payable _to, uint amount) public {
        balanceReceived[msg.sender].totalBalance -= amount; 

        // record withdrawal
        Transaction memory withdrawal = Transaction(amount, block.timestamp);
        balanceReceived[msg.sender].deposits[balanceReceived[msg.sender].numWithdrawal] = withdrawal;
        balanceReceived[msg.sender].numWithdrawal++;

        // send balance
        _to.transfer(amount);
    }
}