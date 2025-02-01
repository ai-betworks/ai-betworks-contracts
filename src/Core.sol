//SPDX-License-Identifier : MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./Room.sol";

// Core contract managing agent creation, permissions, fees, and registry

contract Core is Ownable{

error Core__RoomCreationFeeZero();
 //roles- users, agents, dao, gamemaster - necessary?
//agent
//room -mapping? struct?
//Fees : agentcreation fee, room creation fee, room creator gets cut, agentcut, daocut
struct FeeStructure {
    uint256 agentCreationFee;
    uint256 roomCreationFee;
    uint256 roomCreatorCut; //basis points
    uint256 agentCreatorCut; //basis points
    uint256 daoCut;//basis points
}

FeeStructure public feeStructure;

event FeesSet(uint256 indexed roomCreationFee, uint256 indexed agentCreationFee, uint256 indexed roomCreatorCut, uint256 agentCreatorCut, uint256 daoCut); //can it be tracked without indexed?

    constructor() Ownable(msg.sender){ //owner is admin of dao
        fees = FeeStructure({
            agentCreationFee: 0.01 ether,
            roomCreationFee: 0.005 ether,
            roomCreatorCut: 1000,
            agentCut: 200,
            daoCut: 200 //platform fee/ dao fee
        });

    }
    receive() external payable {
    }
    fallback() external {
    }
    
    function setFee(uint256 roomcreationFee, uint256 agentcreationFee, uint256 roomcreatorCut, uint256 agentcreatorCut, uint256 daocut) public onlyOwner {
        if(roomcreationFee <= 0) {
            Core__RoomCreationFeeZero();
        }
        feeStructure.roomCreationFee = roomcreationFee; //fee in wei
        feeStructure.agentCreationFee = agentcreationFee; //fee in wei
        feeStructure.roomCreatorCut = roomcreatorCut;
        feeStructure.agentCreatorCut = agentcreatorcut;
        feeStructure.daoCut = daocut;
        emit FeesSet(roomcreationFee, agentcreationFee, roomcreatorCut, agentcreatorCut, daocut);

    }
}
    //map user balances, dao balances

    //main functions
    /* function createAgent() public {
    }
    function createRoom() public {
    }
    function withdrawBalance() public {
    }


    //getters
        function getAgentDetails() public {
    }
    function getRoomDetails() public {
    }
    function getFee() external view returns (uint256, uint256, uint256, uint256, uint256) {
        return (feeStructure.roomCreationFee, feeStructure.agentCreationFee, feeStructure.roomCreatorCut, feeStructure.agentCreatorCut, feeStructure.daoCut);
    }
     /*

