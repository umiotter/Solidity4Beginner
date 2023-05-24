// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract EtherWallet {
    // function: 
    // 1. receive ETH
    // 2. withdraw ETH
    // 3. achieve the balance of wallet
    address payable public owner;

    constructor() {
        // because owner is payable variable, the instance also need to be paybale.
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint _amount) external {
        require(owner == msg.sender, "caller is not owner!");
        // using msg.sender spends less gas than using owner
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}