// SPDX-License-Identifier: GPL-3.0-only	
pragma solidity ^0.8.0;

import { Owned } from "./Owned.sol";

contract WithdrawWallet is Owned {
  mapping (address => uint) limitMap;

  receive () external payable {
      
  }

  function addWithdrawPermission(address _to, uint _limit) public onlyOwner {
    limitMap[_to] = _limit;
  }

  function withdrawMoney(uint _sum) public {
    require(limitMap[msg.sender] >= _sum, "You limit is less than you're requiring");
    require(limitMap[msg.sender] <= address(this).balance, "Not enough funds in the contract account");

    // Default user flow
    if (owner != msg.sender) {
      require(limitMap[msg.sender] != 0, "You limit is empty");
    }

    saveWithdrawMoney(_sum);
  }

  function saveWithdrawMoney(uint _sum) private {
    limitMap[msg.sender] -= _sum;

    payable(msg.sender).transfer(_sum);
  }
}