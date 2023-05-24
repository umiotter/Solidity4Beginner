// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Error {
    // gas fee: error < assert < require

    function testRequire(uint _i) public pure{
        require(_i<10, "i > 10");
    }

    function testRevert(uint _i) public pure{
        if (_i>10){
            revert("i > 10");
        }
    }

    function testAssert(uint _i) public pure{
        assert(_i<10);
    }

    error RaiseError();
    function testError(uint _i) public pure{
        if (_i>10){
            revert RaiseError();
        }
    }

}