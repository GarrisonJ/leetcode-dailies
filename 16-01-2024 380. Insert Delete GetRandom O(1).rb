class RandomizedSet
    def initialize()
        @vals_list = []
        @vals_hash = {}
    end


=begin
    :type val: Integer
    :rtype: Boolean
=end
    def insert(val)
        return false if @vals_hash.include?(val)
        @vals_list.append(val)
        @vals_hash[val] = @vals_list.size-1
        true
    end


=begin
    :type val: Integer
    :rtype: Boolean
=end
    def remove(val)
        return false if !@vals_hash.include?(val)
        index = @vals_hash[val]
        @vals_list[index] = @vals_list[-1]
        @vals_hash[@vals_list[index]] = index
        @vals_hash.delete(val)
        @vals_list.pop
        true
    end


=begin
    :rtype: Integer
=end
    def get_random()
        index = rand(0..@vals_list.size-1)
        @vals_list[index]
    end


end

# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet.new()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.get_random()
