// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Proxy {
    event Deploy(address);

    function deploy(bytes memory _code) external payable returns(address addr) {
        // 内联系汇编, 其实就是go语言
        address addr;

        assembly {
            // create(v, p, n)
            // v = amount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            // 内联汇编中的v不可以使用msg.value获取
            // 0x20指的是—参数—_code的位置之后的address addr;这条语句的位置
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr!=address(0), "deploy failed");
        emit Deploy(addr);
    }
}