# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
    set = Set.new((0..Math.sqrt(c).to_i+1).map {|x| x**2}.to_a)
    set.each do |i|
        return true if set.include?(c-i)
    end
    false
end
