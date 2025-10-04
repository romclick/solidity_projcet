//SPDX-License-Identifier: MIT
pragam ^0.8.0;

contract IntegerToRoman{
    uint[] private values = [1000,900,500,400,100,90,50,40,10,9,5,4,1];
    string[] private symbols = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];

    function intToRoman(uint num) public view return(string memory){
        //罗马数字仅支持1~3999
        require(num >=1 && num <= 3999,"Number must between 1 and 3999.")
        string memory result = "",
        //从最大数值开始匹配
        for (uint i=0; i<values.length ;i++) {
            while (num >= values[i]) {
                result = string(abi.encodePacked(result,symbols[i]));
                num = num - values[i];
                
            }
        }
        return result;
    }
}
