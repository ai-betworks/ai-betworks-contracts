// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {Core} from "../src/Core.sol";

contract GetCoreFees is Script {
    function run(address coreAddress) public {
        // No need for private key as this is a read-only operation
        Core core = Core(payable(coreAddress));

        // Get the fee structure
        (
            uint256 roomCreationFee,
            uint256 agentCreationFee,
            uint256 roomCreatorCut,
            uint256 agentCreatorCut,
            uint256 daoCut
        ) = core.getFees();

        // Get the basis points for percentage calculations
        uint256 basisPoints = core.BASIS_POINTS();

        console2.log("Core Address: ", coreAddress);
        console2.log("Room Creation Fee: ", roomCreationFee, " wei");
        console2.log("Agent Creation Fee: ", agentCreationFee, " wei");

        // Output the results

        string memory roomCreatorPct = vm.toString((roomCreatorCut * 100) / basisPoints);

        string memory agentCreatorPct = vm.toString((agentCreatorCut * 100) / basisPoints);

        string memory daoPct = vm.toString((daoCut * 100) / basisPoints);

        console2.log("Room Creator Cut Percentage: ", roomCreatorPct, "%");
        console2.log("Agent Creator Cut Percentage: ", agentCreatorPct, "%");
        console2.log("DAO Cut Percentage: ", daoPct, "%");
    }
}
