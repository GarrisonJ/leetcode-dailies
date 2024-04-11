# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
    return num if k == 0
    return "0" if k == num.size

    i = 0
    while i <= num.size-2 && k != 0 do
        if num[i] > num[i+1]
            num.slice!(i)
            k-=1
            i = [i-2, 0].max
        else 
            i+=1
        end
    end
    if k != 0
        num = num[..(-k-1)]
    end
    num.to_i.to_s
end
