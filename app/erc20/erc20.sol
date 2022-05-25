// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GLDToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Gold", "GLD") {
        _mint(msg.sender, initialSupply);
    }
}

contract ABCToken {
    GLDToken gld;
    constructor(GLDToken _gld){
        gld = _gld(msg.sender);
    }
    
    function send(address _to,uint256 num) external{
        gld.transfer(_to,num);
    }
}
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
