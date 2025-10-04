//SPDX-License-Identifier: MIT
pragam ^0.8.0;

contract ReverseString{
    function reverse(string memory input) public pure returns(string memory) {
        bytes memory inputBytes =  bytes(input);
        uint length = inputBytes.length ;

        if (lenght == 0) {
            return "";
        }

        bytes memory reverseBytes = new bytes(lenght);
        for (uint i = 0 ; i < lenght ; i++) {
            reverseBytes[i] = inputBytes[lenght -1 -i];
        }
        return string(reverseBytes);
    }
}
