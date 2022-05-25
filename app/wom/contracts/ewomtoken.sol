// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol';
import '@openzeppelin/contracts/security/Pausable.sol';

contract EWOMToken is ERC20, ERC20Burnable, Ownable, Pausable {

    uint256 public maxSupply;

    constructor(address beneficiary) ERC20("EWOM", "EWOM") {
        maxSupply = 10 ** 9 * 10 ** uint256(decimals()); // 1B
        _mint(beneficiary, maxSupply);
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal
    whenNotPaused
    override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
