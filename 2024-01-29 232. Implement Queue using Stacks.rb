class MyQueue
    def initialize()
        @pop_list = []
        @push_list = []
        
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        if @pop_list.empty?
            @pop_list << x
        else
            @push_list << x
        end
    end


=begin
    :rtype: Integer
=end
    def pop()
        value = @pop_list.pop

        if @pop_list.empty?
            while !@push_list.empty?
                @pop_list << @push_list.pop
            end
        end
        value
    end


=begin
    :rtype: Integer
=end
    def peek()
         @pop_list[-1]
    end


=begin
    :rtype: Boolean
=end
    def empty()
        @pop_list.empty?
    end


end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()
