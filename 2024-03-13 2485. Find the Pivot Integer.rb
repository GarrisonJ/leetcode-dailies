# @param {Integer} n
# @return {Integer}
def pivot_integer(n)
    return 1 if n == 1
    
    left = 1
    right = n

    while left < right do
        mid = (left+right)/2
        left_sum = ((mid+1)*mid)/2
        right_sum = ((((n+1)*n)/2) - left_sum) + mid
        return mid if left_sum == right_sum
        if left_sum < right_sum
            left = mid+1
        else
            right = mid-1
        end
    end
    -1
end
