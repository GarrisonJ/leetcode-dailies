# @param {Integer[]} arr
# @return {Integer}
def count_triplets(arr)    
    count = 0
    arr.size.times do |i|
        (i+1..arr.size-1).each do |j|
            if arr[i..j].reduce(:^) == 0
                count += j-i
            end
        end
    end
    count
end
