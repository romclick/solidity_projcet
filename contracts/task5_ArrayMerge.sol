//SPDX-License-Identifier: MIT
pragam ^0.8.0;

contract ArrayMerge {
    //合并两个有序数组，返回新的有序数组
    function mergeArrays(uint[] memory arr1, uint[] memory arr2) public pure returns(uint[] memory){
        uint len1 = arr1.length;
        uint len2 = arr2.length;
        uint[] memory result = new uint[](len1+len2);

        uint i = 0;
        uint j = 0;
        uint k = 0;

        //双指针合并
        while(i < len1 && j < len2){
            if (arr1[i] <= arr2[j]){
                result[k]=arr1[i];
                i++;
            }else{
                result[k]=arr2[j];
                j++;
            }
            k++;
        }
        //处理剩余
        while(i < len1){
            result[k]=arr1[i];
            i++;
            k++;
        }

        while(j < len2){
            result[k]=arr2[j];
            i++;
            k++;
        }
        return result;

    }

}