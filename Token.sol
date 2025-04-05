// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MemeCoin is ERC20 {
    mapping(address => bool) private hasClaimed;

    constructor() ERC20("TheMythicToken", "TMT") {
        _mint(address(this), 1000000000 * 10**18); // Mint tokens to the contract for distribution
    }

    function claimInitialTokens() external {
        require(!hasClaimed[msg.sender], "Tokens already claimed");
        uint256 initialAmount = 100 * 10**18; // 100 tokens
        hasClaimed[msg.sender] = true;
        _transfer(address(this), msg.sender, initialAmount);
    }
}