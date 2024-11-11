# @param {Integer[]} nums
# @return {Boolean}
def prime_sub_operation(nums)
    @primes = make_primes(1000)

    (nums.size-2).downto(0).each do |i|
        if nums[i] >= nums[i+1]
            p = 0
            while p < @primes.size-1 && nums[i] - @primes[p] >= nums[i+1] do
                p += 1
            end
            if nums[i] - @primes[p] >= nums[i+1] || @primes[p] >= nums[i]
                return false
            else
                nums[i] -= @primes[p]
            end
        end
    end
    true
end

def make_primes(limit)
    primes = [2]

    not_prime = Set.new
    (2..limit).step(2).each do |not_p|
        not_prime << not_p
    end
    (3..limit).each do |p|
        if !not_prime.include?(p)
            primes << p
            (p..limit).step(p).each do |not_p|
                not_prime << not_p
            end
        end
    end
    primes
end
