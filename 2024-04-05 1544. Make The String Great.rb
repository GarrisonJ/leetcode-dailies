# @param {String} s
# @return {String}
def make_good(s)
    loop do 
        to_remove = nil
        (0..s.size-2).each do |i|
            if s[i] != s[i+1] && s[i].downcase == s[i+1].downcase
                to_remove = i
                break
            end
        end
        break if to_remove.nil?
        s[to_remove+1] = ''
        s[to_remove] = ''
    end
    s
end
