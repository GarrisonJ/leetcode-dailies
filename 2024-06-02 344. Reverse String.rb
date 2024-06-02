# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s) 
    i = 0
    j = s.size-1
    while i < j do
        s[i], s[j] = s[j], s[i]
        i+=1
        j-=1
    end
end

# def reverse_string(s) = s.reverse!
