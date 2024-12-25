// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract fabriCodeERC20 is ERC20, Ownable {

    //Errores
    error ERC20MaxSupply();

    //Events
    event mintEvent(address indexed account, uint256 value);
    event burnEvent(address indexed account, uint256 value);

    uint256 private _maxSupply;

    constructor (uint256 _maxSupply_) ERC20("FabriCode ERC20", "FC") Ownable(msg.sender) {
        _maxSupply = _maxSupply_;
    }
    
    function mint (address account, uint256 value) external onlyOwner
    {
        if (totalSupply()+value > _maxSupply)
        {
            revert ERC20MaxSupply();
        }
        _mint(account, value);

        emit mintEvent(account, value);
    }

    function burn (uint256 value) public 
    {
        _burn(msg.sender, value);

        emit burnEvent(msg.sender, value);
    }

}