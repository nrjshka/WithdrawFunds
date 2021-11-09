// SPDX-License-Identifier: GPL-3.0-only	
pragma solidity ^0.8.0;

import "./Owned.sol";

contract WithdrawWallet is Owned {
  address owner;
  
  constructor() {
    owner = msg.sender;
  }

  fallback() external {

  }
}