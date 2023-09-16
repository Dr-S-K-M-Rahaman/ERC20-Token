pragma solidity ^0.8.9;

// SPDX-License-Identifier: MIT

interface IContract {
    function transfer(address, uint256) external returns (bool);
}