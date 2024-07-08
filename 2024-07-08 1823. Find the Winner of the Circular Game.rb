# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_the_winner(n, k)    
    ans = 0
    (2..n).each do |i|
        ans = (ans+k) % i
    end
    ans+1
end

