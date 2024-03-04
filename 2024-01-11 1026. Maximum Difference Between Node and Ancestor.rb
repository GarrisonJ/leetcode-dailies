def max_ancestor_diff(root)
    @max_diff = 0
    solve(root, root.val, root.val)
    @max_diff
end

def solve(root, min, max)
    return if !root
    @max_diff = [@max_diff, (min-root.val).abs, (max-root.val).abs].max
    solve(root.left, [min, root.val].min, [max, root.val].max)
    solve(root.right, [min, root.val].min, [max, root.val].max)
end
