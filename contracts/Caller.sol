// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 要被调用的合约
contract CalledContract{
	uint256 public x = 0;
    
    fallback() external payable{}

    // 查看该合约余额
    function getBalance() view public returns(uint){
    	return address(this).balance;
    }

    // 设置x, 并且如果有ETH转入则释放转入事件
    event Log(uint amount, uint gas);
    function setX(uint256 _x) external payable{
    	x = _x;
        if(msg.value > 0){
        	emit Log(msg.value, gasleft()); // gasleft()是Solidity自带用于该函数消耗的gas
        }
    }
}

// 代理合约
contract Proxyer{

    event Response(bool success, bytes data);

    function setXProxyer(address payable _addr, uint256 _x) external payable{
    	(bool success, bytes memory data) = _addr.call{value:msg.value}(
                abi.encodeWithSignature("setX(uint256)", _x)
            );
        emit Response(success, data);
    }
}