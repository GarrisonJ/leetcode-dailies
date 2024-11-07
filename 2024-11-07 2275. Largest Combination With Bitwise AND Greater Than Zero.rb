# @param {Integer[]} candidates
# @return {Integer}
def largest_combination(candidates)
    register_count = Array.new(32, 0)
    candidates.each do |c|
        c.to_s(2).reverse.each_char.with_index do |d, i|
            register_count[i] += 1 if d == "1"
        end
    end
    register_count.max
end
