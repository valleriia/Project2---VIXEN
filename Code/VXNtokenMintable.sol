pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

contract VXNtoken is ERC20, ERC20Detailed, ERC20Mintable {
    constructor(
        string memory name,
        string memory symbol,
        uint initial_supply, 
        uint total_supply
    )
        ERC20Detailed(name, symbol, 18)
        public
    {
        total_supply = initial_supply * 10 ** uint256(18);  // Update total supply with the decimal amount
        //balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        _mint(msg.sender, total_supply);
        // constructor can stay empty
    }
}
