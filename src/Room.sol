//SPDX-License-Identifier : MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Core.sol";

contract Room is Ownable {

    error Room_RoundActive(uint256 roundId);
    error Room_RoundNotActive(uint256 roundId);
    error Room_RoundClosed(uint256 roundId);

    address public token;
    address public creator;
    uint256 public currentRoundId;
    address[5] public agents;
    Core public core;
    IERC20 public USDC;
    RoomFees public fees;

    struct Round {
        RoundState state;
        uint40 startTime;
        uint40 endTime;
    }

    struct RoomFees {
        uint256 roomEntryFee;
        uint256 messageInjectionFee;
        uint256 muteForaMinuteFee;
    }
    struct Bet{
        BetType bet;
        uint256 amount;
        bool claimed;
    }

    mapping(uint256 => Round) public rounds; //roundid to struct
    mapping(address => bool) public isAgent;
    mapping(uint256 => mapping(address => bool)) public agentDecisions; //roundid to agentaddress to decision
    mapping(uint256 => mapping(address => mapping(address => BetType))) public bets; //rounid to useraddress to agentaddress to bet

    event MessageInjected(address indexed sender, uint256 indexed roundId);
    event JoinedRoom(address indexed sender, uint256 indexed roundId);
    event MutedForaMinute(address indexed sender, uint256 indexed roundId, address indexed agentToMute);

    constructor(address tokenaddress,address creatoraddress,address coreaddress, address[5] memory _agents, uint256 roomEntryFee, uint256 messageInjectionFee, uint256 muteForaMinuteFee) Ownable(coreaddress) {
        token = tokenaddress;
        creator = creatoraddress;
        
        fees = RoomFees({
            roomEntryFee: roomEntryFee,
            messageInjectionFee: messageInjectionFee,
            muteForaMinuteFee: muteForaMinuteFee
        });
        unchecked { 
            for (uint256 i; i < 5;) {
                address agent = _agents[i]; 
                require(!isAgent[agent], "Duplicate agent");
                agents[i] = agent;
                isAgent[agent] = true;
                ++i; 
            }}
        startRound();
    }

    enum RoundState {OPEN, CLOSED, PROCESSING}
    enum BetType {BUY , NOTBUY}
    enum AgentDecision {BUY, NOTBUY}

    function startRound() public {
    
        if(rounds[currentRoundId].endTime > block.timestamp){
            revert Room_RoundActive(currentRoundId);
        }
        currentRoundId++;
        rounds[currentRoundId] = Round({
            state: RoundState.OPEN,
            startTime: uint40(block.timestamp),
            endTime: uint40(block.timestamp + 5 minutes)
        });
       
    }
    function updateFees(uint256 roomEntryFee, uint256 messageInjectionFee, uint256 muteForaMinuteFee) public {
         fees = RoomFees({
            roomEntryFee: roomEntryFee,
            messageInjectionFee: messageInjectionFee,
            muteForaMinuteFee: muteForaMinuteFee
        });
    }

    function joinRoom() public payable { //accepting eth for now
        require(msg.value == fees.roomEntryFee, "Incorrect room entry fee");
       emit JoinedRoom(msg.sender, currentRoundId);
       
    }
    function injectMessage(uint256 roundId) public payable {
        require(msg.value == fees.messageInjectionFee, "Incorrect message injection fee");
        emit MessageInjected(msg.sender, currentRoundId);//ask team to handle messages
    }
    function muteForaMinute(uint256 round, address agentToMute) public payable {
        require(msg.value == fees.muteForaMinuteFee, "Incorrect mute fee");
        emit MutedForaMinute(msg.sender, round, agentToMute);

    }

   function _transferfeestoCore() public {
        //round end check
        //transfer to core
    }

    function placeBet(uint256 roundId, address agentAddress,BetType userbet,uint256 amount) public {
    
        if(rounds[roundId].state != RoundState.OPEN){
            revert Room_RoundNotActive(roundId);
        }
        require(isAgent[agentAddress], "Invalid agent address");
        require(amount > 0, "Bet amount must be greater than zero");
        require(bets[roundId][msg.sender][agentAddress] == BetType(0), "Bet already placed");

        USDC.transferFrom(msg.sender, address(this), amount);

        bets[roundId][msg.sender][agentAddress] = userbet;
   
    }
   
    
   
}