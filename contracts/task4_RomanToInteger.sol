//SPDX-License-Identifier: MIT
pragam ^0.8.0;

contract RomToInteger {
    mapping (bytes => uint) private romanValues;
    constructor() {
        romanValues["I"] = 1;
        romanValues["V"] = 5;
        romanValues["X"] = 10;
        romanValues["L"] = 50;
        romanValues["C"] = 100;
        romanValues["D"] = 500;
        romanValues["M"] = 1000;
        
    }

    function romToInt(string memory s) public views returns (uint) {
        uint length = bytes(s).length
        require(length >0,"Empty is not a valid Roman Number");

        uint result = 0;
        uint prevValue = 0;

        //倒序遍历
        for (int i = int(length) -1 ; i >= 0 ; i--){
            bytes1 char = bytes(s)[uint(i)];
            uint currentValue = romanValues[char];

            //若当前值小于前一个值，则减
            if (currentValue < prevValue) {
                result -= currentValue;
            } else {
                result += currentValue;                
            }
            prevValue = currentValue;
        }
        return result;
        
    }
}