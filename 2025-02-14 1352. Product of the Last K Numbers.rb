class ProductOfNumbers
    def initialize()
        @products = [1]
    end


=begin
    :type num: Integer
    :rtype: Void
=end
    def add(num)
        if num == 0
            @products = [1]
        else
            @products << num*@products[-1]
        end
    end


=begin
    :type k: Integer
    :rtype: Integer
=end
    def get_product(k)
        return 0 if @products.size <= k
        @products[-1] /  @products[-(k+1)]
    end
end

# Your ProductOfNumbers object will be instantiated and called as such:
# obj = ProductOfNumbers.new()
# obj.add(num)
# param_2 = obj.get_product(k)
