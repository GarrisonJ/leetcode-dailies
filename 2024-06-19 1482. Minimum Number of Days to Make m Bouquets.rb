# @param {Integer[]} bloom_day
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
def min_days(bloom_day, m, k)
    return -1 if m*k > bloom_day.size
    i = 0
    j = bloom_day.max
    while i < j do
        mid = (j+i)/2
        if enough(bloom_day, mid, m, k)
            j=mid
        else
            i=mid+1
        end
    end
    i
end

def enough(bloom_day, day, m, k)
    count = 0
    i = 0
    while i < bloom_day.size do
        j = i
        flowers = 0
        while j < bloom_day.size && flowers < k do
            if bloom_day[j] <= day
                flowers+=1
            else
                j+=1
                break
            end
            j+=1       
        end
        count+=1 if flowers==k
        return true if count == m    
        i = j
    end
    false
end
