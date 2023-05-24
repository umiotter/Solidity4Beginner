// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FunctionIntro {
    // function <function name> (<parameter types>) {internal|external|public|private} [pure|view|payable] [virtual] [override] [returns (<return types>)]
    
    // [pure|view|payable]
    /// pure function can't write or read state on chain
    function add(uint x, uint y) external pure returns(uint) {
        return x + y;
    }
    function sub(uint x, uint y) external pure returns(uint) {
        return x - y; 
    }
    // view
    //// view function only can read state on chain
    uint public number;
    function addToNum(uint x) external view returns(uint) {
        return number + x;
    }
    // payable
    //// exteral accout can tranfer ETH to this contract while call payable funciton
    function addToNum(uint x, uint y) external payable  returns(uint) {
        return number + x + y;
    }

    // default
    //// if not specific sign is used, function has the privilege to read and write.
    function inc() external {
        // read number and add 1
        number += 1;
    }
}