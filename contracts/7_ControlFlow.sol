// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ControlFlow{
    function ifelse(bool b) external pure returns(bool){
        if(b == true){
            return true;
        }else{
            return false;
        }
    }

    function loop(uint n) external pure returns(uint){
        uint res;
        for(uint i = 1; i <= n; i++){
            res += i;
            if(i==3){
                continue;
            }
            if(i==5){
                break;
            }
        }
        while(res!=0){
            res -= 1;
        }
    } 
}