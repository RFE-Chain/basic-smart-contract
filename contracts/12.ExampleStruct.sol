// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleStruct {
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        payment = PaymentReceivedStruct(msg.sender, msg.value);
    }
}