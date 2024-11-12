# @param {Integer[][]} items
# @param {Integer[]} queries
# @return {Integer[]}
def maximum_beauty(items, queries)
    items.sort_by! { |item| item[0] }

    new_items = []
    items.each do |item|

        # remove less beautiful items of the same price
        while !new_items.empty? && 
                item[0] == new_items[-1][0] &&
                item[1] > new_items[-1][1]
            new_items.pop
        end

        # Insert item if it's more beautiful
        if new_items.empty? || 
            item[1] > new_items[-1][1]
            new_items << item
        end
    end

    ans = []
    queries.each do |q|
        # Find the first item that's too expensive 
        i = new_items.bsearch_index { |item| item[0] > q }

        if i.nil? # If no item is too expensive, take the last item
            ans << new_items[-1][1]
        elsif i == 0 # If all items are too expensive
            ans << 0
        else # Take the item
            ans << new_items[i-1][1]
        end
    end
    ans

end
