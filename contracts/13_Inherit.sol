// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract grandpa {
    // 如果有函数需要子合约重新实现,那么该函数需要被标记virtual关键字
    function foo() public pure virtual returns(string memory){
        return "grandpa";
    }

    function bar() public pure virtual returns(string memory){
        return "grandpa";
    }

    function yeye() public pure returns(string memory){
        return "grandpa";
    }
}

contract father is grandpa {

    receive() external payable {}
    // 并且如果还有子合约需要继承Y, 那么Y的所有来自X的带virtual的函数也需要标记virtual
    function foo() public pure virtual override returns(string memory){
        return "father";
    }
    function bar() public pure virtual override returns(string memory){
        return "father";
    }
    function baba() public pure returns(string memory){
        return "father";
    }
}

contract uncle is grandpa{
    string public name;
    // 构造函数只能有一个
    constructor(string memory _name){
        name = _name;
    }

    function foo() public pure  virtual override returns(string memory){
        return "uncle";
    }

    function bar() public pure virtual override returns(string memory){
        return "uncle";
    }

    function shushu() public pure returns(string memory){
        return "shushu";
    }

}

// 多重继承, 以下两种写法都可以, 两个son都继承了grandpa的爷爷方法() 
// 因为uncle有带参数的构造器, 因此继承uncle的子合约，如果参数已知的情况下需要往构造传参数,
// 参数未知的情况请看son1合约
contract son is grandpa, father, uncle("chen"){
    // 子合约需要实现父合约的所有带virtual的函数, 
    // 儿子合约拥有爷爷和爸爸的x和y方法.
    function foo() public pure override(grandpa, father, uncle) returns(string memory){
        return "son";
    }
    function bar() public pure override(grandpa, father, uncle) returns(string memory){
        return "son";
    }
    function erzi() public pure returns(string memory){
        return "erzi";
    }

}

contract son1 is father, uncle{
    // 若构造器参数未知, 则需要使用需要用如下方法重写构造器
    // 合约会按照继承的顺序初始化构造函数, 也就是father, uncle
    constructor(string memory _name) uncle(_name){

    }
    function foo() public pure override( father, uncle) returns(string memory){
        return "son1";
    }
    function bar() public pure override( father, uncle) returns(string memory){
        return "son1";
    }
    function erzi() public pure returns(string memory){
        return "erzi1";
    }
}