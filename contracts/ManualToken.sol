// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ManualToken {
    uint256 initialSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    //transfer token
    // substract from and adddress and add to another address
    function transfer(address from, address to, uint256 amount) public {
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 value
    ) public returns (bool success) {
        require(value <= allowance[_from][msg.sender]); // Check if msg.sender is allowed to transfer token
        allowance[_from][msg.sender] -= value;
        transfer(_from, _to, value);
        return true;
    }
}
