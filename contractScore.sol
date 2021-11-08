// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Score {
    address owner;
    
    uint score;
    
    constructor() {
        score = 1;
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        }
    }
    
    mapping(address => uint) score_list;
    
    function getUserScore(address user) public view returns (uint) {
        return score_list[user];
    }
    
    /*
    * this is a general getter function but the above getUserScore function does the job as well
    function getScore() public view returns (uint) {
        return score;
    }
    */
    event Score_set(uint);
    
    function set(uint new_score) public onlyOwner {
        score = new_score;
        emit Score_set(new_score); // returns the new score whenever a new score is set
    }
    
}
