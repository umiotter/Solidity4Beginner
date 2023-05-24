// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract GlobalVariable {

    // function caller's address
    address sender = msg.sender;
    // block time when function is called
    uint timestamp = block.timestamp;
    // current block number
    uint blockNum = block.number;

}