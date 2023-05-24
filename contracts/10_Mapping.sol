// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Mapping {
    mapping(address => uint) balanceOf;
    mapping(address => mapping(address => bool)) isFriend;

    function examples() external {
        balanceOf[msg.sender] = 123;
        uint bal = balanceOf[msg.sender];
        // default balance value
        uint bal2 = balanceOf[address(1)]; // 0
        // modify balance value
        balanceOf[msg.sender] += 456; // 123 + 456
        delete balanceOf[msg.sender]; // the value of index msg.sender euqal to 0
        isFriend[msg.sender][address(this)] = true; // set the caller and the contract as friends
    }
}