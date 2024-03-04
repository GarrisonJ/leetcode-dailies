# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    counter = Hash.new(0)
    s.chars.tally(counter)

    s.each_char.with_index do |c, i|
        return i if counter[c] == 1
    end
    -1
end
