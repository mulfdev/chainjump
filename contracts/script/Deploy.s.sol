// SPDX-License-Identifier: LicenseRef-FSL-1.1-ALv2

pragma solidity ^0.8.0;

import { WorkerRegistry } from "../src/WorkerRegistry.sol";
import { console } from "forge-std/src/Console.sol";
import { BaseScript } from "./Base.s.sol";

/// @dev See the Solidity Scripting tutorial:
/// https://book.getfoundry.sh/tutorials/solidity-scripting
contract Deploy is BaseScript {
    function run() public broadcast {
        console.log("Deploying from address: ", broadcaster);
        new WorkerRegistry(broadcaster);
    }
}
