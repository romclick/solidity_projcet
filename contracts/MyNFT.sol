// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721, Ownable {
    //记录当前NFT编号
    uint256 private _tokenIdCounter;

    //构造函数，设置NFT的名称和符号
    constructor(string memory name, string memory symbol) ERC721(name, symbol) Ownable(msg.sender){
        _tokenIdCounter = 0;
    }

    //铸造NFT函数
    function mintNFT(address recipient, string memory tokenURL) 
        public 
        Ownable  
        returns (uint256) {
        uint256 newTokenId = _tokenIdCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURL(newTokenId, tokenURL);

        _tokenIdCounter++;
        return newTokenId;
    }
}