# @param {Integer} num_bottles
# @param {Integer} num_exchange
# @return {Integer}
def num_water_bottles(num_bottles, num_exchange)
    result = 0
    empty = 0

    while num_bottles > 0  do
        result += num_bottles
        empty += num_bottles
        num_bottles = empty / num_exchange
        empty = empty % num_exchange
    end
    result
end
