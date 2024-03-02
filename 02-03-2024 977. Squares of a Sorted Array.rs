impl Solution {
    pub fn sorted_squares(nums: Vec<i32>) -> Vec<i32> {
        let mut result = vec![0 as i32; nums.len()];
        
        let mut left = 0;
        let mut right = nums.len() - 1;

        for i in (0..result.len()).rev() {
            if nums[left].abs() > nums[right].abs() {
                result[i] = nums[left]*nums[left];
                left += 1;
            } else {
                result[i] = nums[right]*nums[right];
                right -= 1;
            }
        }

        result
    }
}
