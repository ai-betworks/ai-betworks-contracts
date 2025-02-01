//SPDX-License-Identifier : MIT

pragma solidity 0.8.19;

contract Core {
 //roles- users, agents, dao, gamemaster - necessary?
//agent
//room -mapping? struct?
//Fees : agentcreation fee, room creation fee, room creator gets cut, agentcut, daocut
    constructor() {
    }

    //map user balances, dao balances

    //main functions
    function createAgent() public {
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

    receive() external payable {
    }
    fallback() external {
    }

}