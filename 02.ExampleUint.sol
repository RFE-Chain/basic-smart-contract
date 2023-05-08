//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleUint {

    uint256 public myUint; //0 - (2^256)-1
    uint8 public myUint8 = 250; // 0 - 258
    int public myInt = -10; //-2^128 to +2^128-1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {
        myUint--;
        // throw error when value reach min uint256's min value
    }

    function incerementUint8() public {
        myUint8++;
        // throw error when value reach max uint8's max value
    }

    function incerementInt() public {
        myInt++;
    }
}