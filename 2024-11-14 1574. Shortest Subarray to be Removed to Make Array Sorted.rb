# @param {Integer[]} arr
# @return {Integer}
def find_length_of_shortest_subarray(arr)
    right = arr.size-1
    while right > 0 && arr[right-1] <= arr[right] do
        right -= 1
    end
    ans = right

    left = 0
    while left < right && (left == 0 || arr[left-1] <= arr[left])
        while right < arr.size && arr[left] > arr[right] do
            right += 1
        end
        ans = [ans, right - left - 1].min
        left += 1
    end
    ans
end


