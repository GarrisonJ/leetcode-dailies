# @param {String} start
# @param {String} target
# @return {Boolean}
def can_change(start, target)
    n = start.size
    start_p = 0
    target_p = 0
    while start_p < n || target_p < n do
        while start_p < n && start[start_p] == "_" do
            start_p+=1
        end
        while target_p < n && target[target_p] == "_" do
            target_p+=1
        end
        return (start_p == n && target_p == n) if start_p == n || target_p == n
        return false if start[start_p] != target[target_p]
        return false if start[start_p] == 'R' && target_p < start_p
        return false if start[start_p] == 'L' && target_p > start_p
        start_p += 1
        target_p += 1
    end
    true
end
