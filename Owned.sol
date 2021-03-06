// SPDX-License-Identifier: GPL-3.0-only	
pragma solidity ^0.8.0;

contract Owned {
  address owner;
  
  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner, "Only owner can call this function");
    _;
  }
}