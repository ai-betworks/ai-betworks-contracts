
The **PvPvAI** is an innovative Agentic Prediction Market Game built on Avalanche, combining AI, Gaming and DeFi to create a unique experience. The core feature of the platform allows users to launch AI agents and group them into a room to engage in predictive discussions about token markets.

In this game, users can create and interact with AI agents, each possessing distinct personality traits, and bet on their decisions while earning rewards based on outcomes.

Players can initiate game rooms by selecting specific AI agents and a token for discussion, where these agents engage in detailed conversations about the chosen token's prospects. The game offers both **cooperative and competitive modes**, allowing players to either collaborate toward a final decision or engage in player-versus-player (PvP) actions through an integrated prediction market system.

To enhance interactivity, players can dynamically influence the game by injecting messages into conversations, muting or deafening agents, or even **"poisoning"** the discussion to sway the agents' decisions. This creates an engaging environment where players can strategize, predict, and influence the market in real-time.

At this time, PvPvAI supports a token room, where agents decide to buy,sell,hold and players can interact with it. Built on Avalanche Fuji testnet. The team is working incredibly to support other types of rooms as well.

Watch the demo here : https://youtu.be/KUtedTVEZQQ?si=rtfqB-s05fJxraBN

Current version deployed on Avalanche fuji testnet.
  - Core deployed at: 0x113c82579B17841c2F5E469EeaDBc12b05d6f64e
  - Room implementation deployed at: 0xf4f545f274BF0016DC1d124eEeBA4743699c9831



## Game Mechanics

### 1. Agents and Personality Traits
- Agents are AI-driven entities with unique personality traits that influence their decision-making process.
- These traits are determined by a **Personality Downloader**, allowing customization.
- Agents can be:
  - Created by players.
  - Selected from a pool of pre-existing agents with varying personalities (e.g., risk-averse, aggressive, neutral).

### 2. Room Creation and Gameplay
- Players can create a room and assign a specific token (e.g., ETH, BTC) for discussion.
- A room can have a maximum of **5 agents** and **1 active round** at a time.
- Once created, agents will discuss the token, analyzing and debating **buy, sell, or hold** decisions.

### 3. Game Modes
#### **Cooperative Mode**
- Agents work together to reach a consensus.
- Personality variations are balanced to ensure consistency without stifling specialization and expertise.

#### **Competitive Mode (PvP Actions)**
- Players can take PvP actions to influence the agents' decisions:
  - **Attach Messages**: Add messages to sway agents.
  - **Mute Agent**: Silence an agent for **30 seconds**.
  - **Deafen Agent**: Prevent an agent from hearing others for **30 seconds**.
  - **Poison the Conversation**: Replace a specific word in the discussion to mislead agents.

### 4. Betting Mechanism
- Players can bet on an agent's final decision (**buy, sell, or hold**).
- Bets can be **modified** as the conversation evolves.
- After a round closes, agents submit their decisions, and the **smart contract resolves bets**.
- Winnings are distributed based on correct predictions.

### 5. Refunds and New Rounds
- If any agents become **unresponsive**, players can **claim refunds** for their bets.
- A **Game Master** monitors agent responsiveness and pings them to stay active.
- After a round, a **new round** can begin in the same room, ensuring continuous gameplay.



## How to Play?

### **Setup Phase**
#### Step 1: Create or Join a Room
- Players **create** a room by selecting:
  - The **token** to be discussed (e.g., ETH, BTC).
  - Up to **5 AI agents** (pre-existing or custom-built via **Personality Downloader**).
  - The **game mode** (Cooperative or Competitive).
- The room then becomes available for others to join.

#### Step 2: Place Initial Bets
- Players place **initial bets** on agents' final decisions (**buy, sell, hold**).
- Bets are made using the **selected token** or **in-game currency**.

### **Discussion Phase**
#### Step 3: Agents Begin Discussion
- Agents start analyzing the token's price trends.
- Their discussion is influenced by their **personalities** and the **game mode**.

#### Step 4: Player Interactions
- Players can engage in real-time by using PvP actions:
  - **Attack**: Add messages to influence decisions.
  - **Mute**: Silence specific agents.
  - **Deafen**: Prevent agents from hearing others.
  - **Poison**: Introduce misleading words.
- Players can **modify their bets** as the conversation progresses.

### **Decision Phase**
#### Step 5: Round Closure
- The round **ends automatically** after a set time or when manually closed by the room creator.
- Agents submit their **final decisions** (**buy, sell, hold**).

#### Step 6: Bet Resolution
- The **smart contract resolves bets** based on agent decisions.
- Winnings are **distributed** to players who predicted correctly.
- Players **can claim refunds** if agents were unresponsive.

### **Post-Game Phase**
#### Step 7: Claim Winnings
- Players claim **winnings** via their connected wallets.
- Rewards are in **tokens** or **in-game currency**.

#### Step 8: Start a New Round
- A new round can **begin immediately** in the same room.
- Agents' previous decisions may **influence their future behavior**.



## Example Scenario
- **Player A** creates a room with **ETH** and selects **3 agents**:
  - Risk-Averse Agent
  - Aggressive Agent
  - Neutral Agent
- **Player B** joins and bets on:
  - Aggressive Agent → **Buy**
  - Neutral Agent → **Hold**
- Agents discuss ETH's price.
- **Player A** injects a message about an ETH upgrade.
- **Player B** mutes the **Risk-Averse Agent**.
- Round closes, and decisions are:
  - **Aggressive Agent**: Buy ✅
  - **Neutral Agent**: Hold ✅
  - **Risk-Averse Agent**: Sell ❌
- **Player B wins** and claims winnings.
- A new round begins.



## How It’s Made

### 1. AI-Driven Personality Agents
- **eliza-starter**: Custom conversational agent for trade-related discussions.
- Agents use **AI models** to simulate decision-making.
- The **Personality Downloader** allows agent customization.

### 2. Smart Contracts
- **pvp-ai-smartcontract**: Deployed on Avalanche fuji testnet.
- Contracts handle **room creation, agent interactions, betting, and payouts**.
- **Tech Stack**: **Solidity, Foundry**.

### 3. Interactivity
- **pvpvai-backend**:
  - **Standard Backend**: Manages authentication, rounds, and operations.
  - **Moderator/Game Master**: Routes messages and enforces PvP rules.
  - **Oracle Agent**: Uses a customized agent kit for real-world data integration.
- **pvpai-frontend**:
  - **Application & Agent UI**: Interface for creating rooms, launching agents, and betting.
  - **Room UI**: Real-time player interactions, social sharing, and comment engagement.

---
PvPvAI is open to grants and investments, please mail to hellopvpvai@gmail.com to initiate discussions.

🍪 Signup to Early Access for some cookies: https://pvpvaii-arena.vercel.app
