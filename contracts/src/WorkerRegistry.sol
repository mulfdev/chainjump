// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract WorkerRegistry is Ownable {
    // Inital stake amount 0.1 ether
    uint256 private STAKE_AMOUNT = 100_000_000_000_000_000;

    struct Worker {
        uint256 stake;
        uint8 performanceScore;
    }

    error IncorrectStakeAmount();
    error AlreadyRegistered();
    error InvalidStakeAmount();

    event WorkerRegistered(address indexed worker);
    event StakeAmountUpdated(uint256 newStakeAmount);

    constructor(address initialOwner) Ownable(initialOwner) {}

    mapping(address => Worker) public registeredWorkers;

    function registerWorker(address workerAddress) external payable onlyOwner {
        if (msg.value != STAKE_AMOUNT) {
            revert IncorrectStakeAmount();
        }

        if (registeredWorkers[workerAddress].stake != 0) {
            revert AlreadyRegistered();
        }

        registeredWorkers[workerAddress] = Worker({ stake: msg.value, performanceScore: 100 });

        emit WorkerRegistered(workerAddress);
    }

    function updateStakeAmount(uint256 newStakeAmount) external onlyOwner {
        if (newStakeAmount == 0) {
            revert InvalidStakeAmount();
        }

        STAKE_AMOUNT = newStakeAmount;

        emit StakeAmountUpdated(newStakeAmount);
    }
}
