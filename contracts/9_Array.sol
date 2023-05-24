// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Array{
    uint[] public _array = [1,2,3];
    uint[3] public _fixArray = [1,2,3];

    function example() external {
        _array.push(4);

        //Dynamic Array didn't have push function;
        uint x = _array[1];
        _array[2] = 777; // [1,2,777,4]
        delete _array[1]; // [1,0,777,4]
        _array.pop();
        uint len = _array.length;

        // create array in memory
        // the length of array in memory is fix.
        // Therefore, it hasn't pop() and push() function.
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }

    // Need a funtion to get all constants in array.
    function returnArray() external view returns(uint[] memory) {
        return _array;
    }

    // Delete one element in array.
    function remove(uint _index) public {
        require(_index < _array.length, "index out of bound");
        for(uint i = _index; i < _array.length - 1; i++) {
            _array[i] = _array[i+1];
        }
        _array.pop();
    }
}