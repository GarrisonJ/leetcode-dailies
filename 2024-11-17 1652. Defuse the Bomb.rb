# @param {Integer[]} code
# @param {Integer} k
# @return {Integer[]}
def decrypt(code, k)
    return [0]*code.size if k == 0
    if k > 0
        sum_ahead(code, k)
    else
        sum_behind(code, k)
    end
end

def sum_behind(code, k)
    i = code.size + k
    j = i
    sum = code[j]
    while j < code.size-1 do
        j+=1
        sum += code[j]
    end
    message = []
    code.size.times do |_|
        message << sum
        sum -= code[i % code.size]
        i+=1
        j+=1
        sum += code[j % code.size]
    end
    message
end

def sum_ahead(code, k)
    i = 1
    j = 0
    sum = 0
    while j < k do
        j+=1
        sum += code[j]
    end
    message = []
    while i <= code.size do
        message << sum
        sum -= code[i % code.size]
        i += 1
        j += 1
        sum += code[j % code.size]
    end
    message
end
