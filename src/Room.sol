//SPDX-License-Identifier : MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./Core.sol";

contract Room is Ownable {
    address public token;
    address public creator;
    address public core;

    constructor(address tokenaddress,address creatoraddress,address coreaddress) Ownable(coreaddress) {
        //tokenAddress, msg.sender, address(this)
        //owner is admin of dao
        token = tokenaddress;
        creator = creatoraddress;
        core = coreaddress;
    }
}