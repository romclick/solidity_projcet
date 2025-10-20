// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9 ;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BeggingContract is Ownable {
    //记录每个捐赠者的地址和金额
    mapping (address => uint256) public donations;
    //捐赠总额
    uint256 public totalDonations;
    //捐赠事件
    event DonationReceived(address indexed donor, uint256 amount);
    //提款事件
    event Withdraw(address indexed owner, uint256 amount);

    //构造函数
    constructor() Ownable(msg.sender) {}

    //捐赠函数
    function donate()  external payable {
        require(msg.value > 0 , unicode"捐赠金额必须大于0");

        //记录捐赠金额
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;

        emit DonationReceived(msg.sender,msg.value);
    }
    //提款函数
    function withdraw() external onlyOwner {

        require(address(this).balance >0, unicode"合约中没有可提取的资金");

        uint256 amount = address(this).balance;

        // 使用 transfer 安全地发送以太币
        payable(owner()).transfer(amount);

        emit Withdraw(owner(), amount);
    }
    //查询某地址的捐赠金额
    function getDonation(address donor) external view returns (uint256) {
        return donations[donor];
    }
    //获取合约当前余额
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}