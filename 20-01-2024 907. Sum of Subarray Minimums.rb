# @param {Integer[]} arr
# @return {Integer}
def sum_subarray_mins(arr)
    sum = 0
    stack = []

    (arr.size+1).times do |i|
        while stack.any? && (i == arr.size || arr[stack.last] >= arr[i])
            mid = stack.pop
            prev = stack.last ? stack.last : -1
            sum += arr[mid] * (i - mid) * (mid - prev)
        end
        stack.append(i)
    end
    
    sum % MODULO
end

 MODULO = 10**9 + 7 
