# @param {String} s
# @return {Integer}
def minimum_length(s)

    left = 0
    right = s.size - 1

    while left < right do 
        if s[left] == s[right]
            while left < right && s[left] == s[left+1] do
                left+=1 
            end
            while left < right && s[right] == s[right-1] do
                right-=1 
            end
            left+=1
            right-=1
        else 
            break
        end
    end
    
    [(right-left) + 1, 0].max
end
