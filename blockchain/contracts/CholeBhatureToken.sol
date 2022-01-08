// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CholeBhature is ERC20 { 
    constructor() ERC20("Chole Bhature", "CB") {
        _mint(msg.sender, 10000);
    }
}