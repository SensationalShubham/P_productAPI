// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.23 <0.9.0;

import { productAPI } from "../src/productAPI.sol";

// import { BaseScript } from "./Base.s.sol";

/// @dev See the Solidity Scripting tutorial: https://book.getfoundry.sh/tutorials/solidity-scripting
contract Deploy {
    function run() public returns (productAPI api) {
        api = new productAPI();
    }
}
