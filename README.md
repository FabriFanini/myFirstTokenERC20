# FabriCode ERC20 Token

## Description
This smart contract implements an ERC20 token called **FabriCode ERC20 (FC)** using OpenZeppelin libraries for Solidity. The token is designed with the following features:

- **ERC20 Compliance**: The contract inherits from OpenZeppelin's standard implementation to ensure compatibility and security.
- **Contract Ownership**: The contract uses OpenZeppelin's `Ownable` module to restrict certain functions to the owner.
- **Maximum Supply (_maxSupply_)**: Defines a maximum limit of tokens that can be minted.
- **Custom Events**: Defines events to log minting and burning operations.

## Main Functions

### 1. **Mint Tokens**
```solidity
function mint (address account, uint256 value) external onlyOwner
```
- Allows the contract owner to mint new tokens.
- Ensures that the total supply does not exceed the maximum limit defined by `_maxSupply`.
- Emits the `mintEvent` when tokens are successfully minted.

### 2. **Burn Tokens**
```solidity
function burn (uint256 value) public
```
- Allows any token holder to burn (destroy) a specific amount of their tokens.
- Emits the `burnEvent` when tokens are successfully burned.

## Contract Properties
- **Token Name**: FabriCode ERC20
- **Token Symbol**: FC
- **Maximum Supply (_maxSupply_)**: Defined in the constructor and cannot be modified afterward.

## Custom Errors
### 1. **ERC20MaxSupply**
Thrown when an attempt to mint tokens exceeds the defined maximum supply.

## Events
### 1. **mintEvent**
```solidity
event mintEvent(address indexed account, uint256 value);
```
Emitted when tokens are successfully minted.

### 2. **burnEvent**
```solidity
event burnEvent(address indexed account, uint256 value);
```
Emitted when tokens are successfully burned.

## Constructor
```solidity
constructor (uint256 _maxSupply_) ERC20("FabriCode ERC20", "FC") Ownable(msg.sender)
```
- Initializes the contract with a name and symbol for the token.
- Defines the maximum supply of tokens that can be minted.
- Assigns the deployer of the contract as the initial owner.

## Usage
1. **Deploy the contract** on an Ethereum-compatible blockchain network (e.g., testnets or mainnet).
2. Provide the `_maxSupply` value during deployment.
3. Use the `mint` and `burn` functions as needed to manage the token supply.

## Requirements
- **Solidity 0.8.20 or higher**.
- **OpenZeppelin Libraries**:
  - [ERC20](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol)
  - [Ownable](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol)

## Deployment Example
```solidity
// Deploy the contract with a maximum supply of 1,000,000 tokens
fabriCodeERC20 token = new fabriCodeERC20(1000000);
```

## License
This contract is licensed under the **MIT License**.
