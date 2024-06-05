# @param {String[]} words
# @return {String[]}
def common_chars(words)
    counter = words.first.chars.tally

    words[1..].each do |w|
        new_counter = Hash.new(0)
        w.each_char do |c|
            if counter.has_key?(c) && counter[c] != 0
                new_counter[c]+=1
                counter[c]-=1
            end
        end
        counter = new_counter
    end
    result = []
    counter.each do |c, count|
        count.times do |_|
            result << c
        end
    end
    result
endt
