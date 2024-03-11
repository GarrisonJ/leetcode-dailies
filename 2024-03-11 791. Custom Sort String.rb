# @param {String} order
# @param {String} s
# @return {String}
def custom_sort_string(order, s)
    orderer = Hash.new(-1)
    order.chars.each_with_index do |c, i|
        orderer[c] = i
    end
    s.chars.sort_by { |c| orderer[c] }.join
end
