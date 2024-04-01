# @param {String} s
# @return {Integer}
def length_of_last_word(s)
    i = s.size - 1
    while s[i] == ' ' do
        i-=1
    end
    count = 1
    while s[i-1] != ' ' && i > 0 do
        count+=1
        i-=1
    end
    count
end
