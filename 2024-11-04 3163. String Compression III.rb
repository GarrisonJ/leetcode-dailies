# @param {String} word
# @return {String}
def compressed_string(word)
    comp = []

    i = 0
    while i < word.size do 
        c = word[i]
        count = 1
        i+=1
        while i < word.size && word[i] == c && count < 9 do
            i+=1
            count+=1
        end
        comp << count.to_s
        comp << c
    end
    comp.join
end
