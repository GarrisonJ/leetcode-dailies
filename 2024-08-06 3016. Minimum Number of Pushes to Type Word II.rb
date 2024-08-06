# @param {String} word
# @return {Integer}
def minimum_pushes(word)
    counts = word.chars.tally.to_a.sort_by(&:last).reverse
    num_keys = 8
    mapped = 0
    pushes = 0 
    counts.each do |s, count|
        if mapped < num_keys
            mapped += 1
            pushes += count
        else mapped >= num_keys
            pushes += count * ((mapped / num_keys) + 1)
            mapped += 1
        end
    end
    pushes
end
