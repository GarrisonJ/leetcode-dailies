def leaf_similar(root1, root2)
    root1_leaves = []
    root2_leaves = []
    leaf_value_sequence(root1, root1_leaves)
    leaf_value_sequence(root2, root2_leaves)
    return root1_leaves == root2_leaves    
end

def leaf_value_sequence(root, leaves)
    return if !root
    if !root.left && !root.right
        leaves.append(root.val)
    else
        leaf_value_sequence(root.left, leaves)
        leaf_value_sequence(root.right, leaves)
    end
end
