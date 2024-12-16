/**
 * @param {number[]} nums
 * @param {number} k
 * @param {number} multiplier
 * @return {number[]}
 */
var getFinalState = function(nums, k, multiplier) {
    for(let i = 0; i < k; i+=1){
        let ele = Math.min(...nums);
        let index = nums.findIndex(l => l == ele);
        nums[index] = nums[index]*multiplier;
    }
    return nums;
};

