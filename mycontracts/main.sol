// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GameItem is ERC1155URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC1155("") {}

    function awardItem(address player, string memory url,uint256 number)
    public
    returns (uint256)
    {
        require(bytes(url).length > 0,"number>0");
        require(number>0,"number>0");

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId, number, "");

        _setURI(newItemId,url);

        _tokenIds.increment();
        return newItemId;
    }
}
