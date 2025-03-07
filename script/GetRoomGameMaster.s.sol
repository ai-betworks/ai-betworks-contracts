// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {Room} from "../src/Room.sol";

contract GetRoomGameMaster is Script {
    function run(address roomAddress) public {
        // No need for private key as this is a read-only operation
        Room room = Room(payable(roomAddress));

        // Get the Game Master address
        address gameMaster = room.gameMaster();

        // Output the result
        console2.log("Room Address:", roomAddress);
        console2.log("Game Master Address:", gameMaster);
    }
}
