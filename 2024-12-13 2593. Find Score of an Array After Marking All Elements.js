/**
 * @param {number[]} nums
 * @return {number}
 */
var findScore = function(nums) {
    const queue = new PriorityQueue({
        compare: (e1, e2) => {
            if (e1[1] > e2[1]) return 1; // do not swap
            if (e1[1] < e2[1]) return -1; // swap

            // elments are the same, compare index
            return e1[0] < e2[0] ? -1 : 1;
        }
    });

    for (let i = 0; i < nums.length; i+=1) {
        queue.enqueue([i, nums[i]], nums[i]);
    }

    let result = 0;
    while (queue.size() != 0) {
        ele = queue.dequeue();
        if (nums[ele[0]] != null) {
            result += nums[ele[0]];
        
            nums[ele[0]] = null;
            if (ele[0]-1 >= 0) {
                nums[ele[0]-1] = null;
            }
            if (ele[0]+1 <= nums.length-1) {
                nums[ele[0]+1] = null;
            }
        }
    }
    return result;
};
