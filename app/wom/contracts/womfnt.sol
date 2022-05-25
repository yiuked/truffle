// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
  
contract WomNFT is ERC1155URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC1155(""){}

    function sendNFT(address creator, string memory url, uint256 amount) public returns (uint256) {
        require(creator != address(0), "address is null");
        require(bytes(url).length > 0, "url is empty");
        require(amount > 0, "amount is 0");

        uint256 tokenId = _tokenIds.current();

        _setURI(url);
        _mint(creator, tokenId, amount, "");

        _tokenIds.increment();
        return tokenId;
    } 
} 

