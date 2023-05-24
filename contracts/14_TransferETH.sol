// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract TransferETH{
    constructor() payable{}

    function sendVidCall(address payable _to) external payable{
        (bool success,) = _to.call{value: 1000}("");
        require(success,"call failed");
    }
}