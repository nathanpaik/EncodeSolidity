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
        balance[owner] += totalSupply;
        totalSupply -= 10000;
        
    }
    
    // may be able to use a struct instead of a mapping but will decide later
    mapping(address => uint) public balance;
    //struct userBalances {
        //address userAddress;
        //uint public view balance;
    //}
    
    event transferIndicator(uint, address);
    
    // not sure if this is the preferred way to transfer may need to edit
    function transer(uint transferAmount, address recipient) public {
        balance[recipient] += transferAmount;
        balance[owner] -= transferAmount;
        emit transferIndicator(transferAmount, recipient);
    }
    
    struct Payment {
        uint transferAmount;
        address recipient;
    }
    
    // references an array of payments for each sneder's associated address
    mapping(address => Payment[]) payments;
    
    function getTotalSupply() public view returns (uint) {
        return totalSupply;
    }
    
    event supplyIncrease(uint);
    
    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit supplyIncrease(1000);
    }
}
