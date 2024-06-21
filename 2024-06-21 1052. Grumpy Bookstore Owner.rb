# @param {Integer[]} customers
# @param {Integer[]} grumpy
# @param {Integer} minutes
# @return {Integer}
def max_satisfied(customers, grumpy, minutes)
    current = 0
    non_grump = 0

    minutes.times do |j|
        current += customers[j] if grumpy[j] == 0
        non_grump += customers[j]
    end
    total = current

    result = non_grump - current

    i = 0
    j = minutes-1
    while j < customers.size-1 do
        current -= customers[i] if grumpy[i] == 0
        non_grump -= customers[i]
        i+=1
        j+=1
        current += customers[j] if grumpy[j] == 0
        non_grump += customers[j]
        total += customers[j] if grumpy[j] == 0
        result = [non_grump - current, result].max
    end
    total + result
end
