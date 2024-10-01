// SPDX-License-Identifier: LicenseRef-FSL-1.1-ALv2
pragma solidity ^0.8.0;

import { BaseScript } from "./Base.s.sol";
import { WorkerRegistry } from "../src/WorkerRegistry.sol";

contract RegisterWorker is BaseScript {
    function run() public {
        WorkerRegistry wr = WorkerRegistry(0x75A6085Bbc25665B6891EA94475E6120897BA90b);
    }
}
