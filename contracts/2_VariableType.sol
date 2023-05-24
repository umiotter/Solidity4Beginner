// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Data types - values and references

contract VariableType {
    // Value Type
    bool public b = true;
    uint public u = 123; // uint = uint256 0 to 2**256 - 1
                         //        uint8   0 to 2**8 - 1
                         //        uint16  0 to 2**16 - 1
                         //        ...
    int public i = -123; // int = int256   -2**255 to 2**255 - 1
                         //       int128   -2**127 to 2**127 - 1
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // bytes32 = 32*8 bits = 32*8/4 hex length
    bytes32 public b32 = 0x7465737400000000000000000000000000000000000000000000000000000000;
    string public str = "HelloWorld";

    // Reference Type
    uint[] public uArray = [1,2,3];
    address[] addrArray = [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2];
    struct Student{
        uint256 id;
        uint256 score; 
    }
    Student student;
    //// initialize struct
    //// Approach 1: 
    function initStudentApproach1() external{
        Student storage _student = student; // assign a copy of student
        _student.id = 11;
        _student.score = 100;
    }
    function initStudentApproach2() external{
        student.id = 11;
        student.score = 100;
    }
    function initStudentApproach3() external{
        student = Student(11,100);
    }
    function initStudentApproach4() external{
        student = Student({id: 11, score: 100});
    }


}