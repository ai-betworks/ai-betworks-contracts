//SPDX-License-Identifier : MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./Core.sol";

contract Room is Ownable {
    address public token;
    address public creator;
    address public core;
    uint256 public currentRoundId;
 
    struct Round {
        
        uint40 startTime;
        uint40 endTime;
        
    }

    mapping(uint256 => Round) public rounds; //roundid to struct
    constructor(address tokenaddress,address creatoraddress,address coreaddress, address agent1, address agent2, address agent3, address agent4, address agent5) Ownable(coreaddress) {
        token = tokenaddress;
        creator = creatoraddress;
        core = coreaddress;
        _startRound();
    }
    enum RoundState {OPEN, CLOSED, PROCESSING}
    enum BetType {BUY , NOTBUY}
    enum AgentDecision {BUY, NOTBUY, UNDECIDED}

    function _startRound() private {
    
        if(rounds[currentRoundId].isActive){
            Room_RoundActive(currentRoundId);
        }
        currentRoundId++;
        rounds[currentRoundId] = Round({
            isActive: true,
            startTime: uint40(block.timestamp),
            endTime: uint40(block.timestamp + 5 minutes)
        });
       
    }
    function endRound() public {
        //check if round is active
        if(!rounds[currentRoundId].isActive){
            Room_RoundNotActive(currentRoundId);
        }
        //check if round has ended
        //check if all agents have submitted their decisions
        //calculate results
        //distribute rewards
        //start new round
    }
    //gamemaster triggers endround
    function joinRoom(address RoomAddress) public {
        //check if room is active
        //check if user has enough balance
        //transfer room creation fee to core
        //add user to room

    }
   
}