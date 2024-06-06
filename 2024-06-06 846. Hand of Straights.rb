# @param {Integer[]} hand
# @param {Integer} group_size
# @return {Boolean}
def is_n_straight_hand(hand, group_size)
    return false unless (hand.size) % group_size == 0
    heap = MinHeap.new(hand)
    while !heap.empty? do
        extra = []
        last_value = nil
        i = 0
        while i != group_size do
            value = heap.pop
            if last_value == value
                extra << value
            else
                return false if !last_value.nil? && last_value+1 != value
                last_value = value
                i +=1
            end
        end
        extra.map { |x| heap << x }
    end
    true
end
