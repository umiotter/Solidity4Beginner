// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Enum{
    enum Status {
        None,
        Pendding,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public status;
    
    struct Order{
        address buyer;
        Status status;
    }

    Order[] public orders;

    function get() external view returns(Status){
        return status;
    }

    function set(Status _status) external{
        status = _status;
    }

    function ship() external{
        status = Status.Shipped;
    }

    function reset() external{
        // The default value of status is fisrt enum value which is "None"
        delete status;
    }



}