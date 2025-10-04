// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping (address => uint256) public candidateVotes;

    mapping (address => bool) hasVoted;

    address public owner;

    constructor() {
        owner = msg.sender;
        
    }
    function vote(address candidate) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidate != address(0),"Invaild candidate address")

        candidateVotes[candidate]++;

        hasVoted[msg.sender] = true;
    }

    function getVotes(address candidate) public view return(uint256){
        return candidateVotes[candidate];
    }

    function resetVotes() public {
        require(msg.sender == owner, "Only Owner can reset votes")
        
    }

}