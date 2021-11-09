// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint totalSupply;
    
    address owner;
    
    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }
    
    constructor() {
        totalSupply = 10000;
        owner = msg.sender;
    }
    
    function getTotalSupply() public view returns (uint) {
        return totalSupply;
    }
    
    event supplyIncrease(uint);
    
    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit supplyIncrease(1000);
    }
}
